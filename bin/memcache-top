#!/usr/bin/perl -w

################################################################################
# memcache-top.pl
#
# "top" for memcache - watch the traffic and other stats in real-time.  Yoikes.
#
# NOTES:
#
#   If Getopt::Long is installed:
#     - Specify instances w/ --instances (multiple times or comma separated)
#     - Specify default port w/ --port (defaults to 11211)
#     - Specify sleep time w/ --sleep (default 3)
#     - Specify color output w/ --color (default) or --nocolor
#     - Specify lifetime stats w/ --lifetime or --nolifetime (default)
#       NOTE: lifetime stats break thresholds for evictions, bytes.
#     - Specify read and write bytes w/ --bytes (default) or --nobytes
#     - Specify get and set commands w/ --commands or --nocommands (default)
#     - Specify cumulative numbers w/ --cumulative (don't use with lifetime)
#
#   If Getopt::Long is not installed:
#     - Specify sleep time by typing a number after the command.
#   Specify instances in @default_instances.
#   Specify thresholds by defining %threshold.
#   Written against memcached v 1.2.3, but works fine w/ later versions.
#
# HISTORY:
#
# v0.3 - 2009-04-22 - ntang
#   Minor cleanups.  First release to google code:
#   http://code.google.com/p/memcache-top/
# v0.4 - 2009-04-23 - ntang
#   Added ability to specify color, sleep time, and servers on command line.
#   Also added checks for Getopt::Long and Term::ANSIColor.
#   Added $default_port = "11211" and padding for short server names.  Server
#     names over 23 characters inc. port will break the column lineups for now.
# v0.4b - 2009-04-23 - ntang
#   Added total capacity, and changed "SERVER" to "INSTANCE" to be more clear.
#     Server now is the hostname, instance is hostname + port.  It will
#     truncate the instance and/or server to fit inside the first column
#     correctly.  (Yay!)  It'll also truncate long reads/ writes (or
#     technically any number) to K or M or G if it exceeds certain limits for
#     readability.
# v0.5 - 2009-04-24 - ntang
#   Cleaned up instances vs. servers so it's internally consistent.
#   Redid printing so that now it stores it all and only refreshes/ prints when
#     it has the full set of data.  Warning: major hackishness.
#   Switched to per-second stats by default w/ lifetime stats available.
# v0.6 - 2009-04-28 - ntang
#   I lied.  One more change... the ability to specify read/write bytes, or
#     get/set commands, or both.  Bear in mind if you specify both you will
#     exceed the width of a standard terminal!  You've been warned.  :P
#   Also, some minor display changes, etc. etc.
#
################################################################################

use strict;
use IO::Socket;
use Time::HiRes 'time';

my (@default_instances, @instances, $remote, $sleep, %threshold, %laststats,
    $usecolor, @keys, $default_port, $version, @out, $lifetime, $bytes,
    $commands, $cumulative);

$version = "0.6";

################################################################################
# CONFIGURATION

# Set $usecolor to 1 to push @out,in, gasp, color.
$usecolor = 1;

# 'Alert' threshold values at which to color the text red.
%threshold = (
    cache_hit		=> 60,		# Cache hit ratio
    usage		=> 90,		# % space used
    time		=> 5,		# Number of ms to run the stats query
    evictions		=> 0,		# Number of evictions per second
    curr_connections	=> 3500,	# Number of current connections
    bytes_read		=> 1000000,	# Bytes read, per second
    bytes_written	=> 1000000,	# Bytes written, per second
    limit_maxbytes	=> 0,		# Total space allocated
    bytes		=> 0,		# Total space used
    cmd_get		=> 1000,	# Get commands
    cmd_set		=> 1000,	# Set commands
);

# Display lifetime stats instead of per-second stats
$lifetime = 0;

# Display read/write bytes
$bytes = 1;

# Display get/set commands
$commands = 0;

# Show cumulative stats (since start of run)
$cumulative = 0;

# Default time to sleep in-between refreshes.
$sleep = 3;

# List of servers/ ports to query.
@default_instances = (
  '127.0.0.1:11211',
);

# Default port to connect to, if not specified
$default_port = "11211";

# END CONFIGURATION
################################################################################

@keys = ('usage', 'cache_hit', 'curr_connections', 'time', 'cmd_get', 'cmd_set',
         'bytes_read', 'bytes_written', 'evictions', 'limit_maxbytes', 'bytes');

if (@ARGV) {
  eval { require Getopt::Long; };
  if ($@) {
    if ( $ARGV[0] =~ /^\d+$/ ) {
      $sleep = $ARGV[0];
    }
    else {
      die "USAGE: memcache-top.pl <optional number of seconds to sleep>\n";
    }
  }
  else {
    use Getopt::Long;
    GetOptions (
      'instances=s'	=> \@instances,
      'sleep=i'		=> \$sleep,
      'port=i'		=> \$default_port,
      'color!'		=> \$usecolor,
      'lifetime!'	=> \$lifetime,
      'bytes!'		=> \$bytes,
      'commands!'	=> \$commands,
      'cumulative!'	=> \$cumulative,
    );
    if (@instances) {
      @instances = split(/,/,join(',',@instances));
    } else {
      @instances = @default_instances;
    }
  }
}
else {
  @instances = @default_instances;
}

if ( $lifetime && $cumulative ) {
  $lifetime = 0;
}

if ( $usecolor ) {
  eval { require Term::ANSIColor; };
  if ($@) { $usecolor = 0; }
  else { use Term::ANSIColor; }
}

my $i = 1;

my (%original);

while ($i) {

  @out = ();

  push @out,"\033[2J";			# This clears the screen, yo.

  push @out,color 'bold' if $usecolor;
  push @out,"\nmemcache-top v$version\t";
  push @out,color 'reset' if $usecolor;
  push @out,"(default port: " . sprintf("%5d",$default_port) . ", color: ";
  push @out,"on," if $usecolor;
  push @out,"off," unless $usecolor;
  push @out," refresh: $sleep seconds)\n\n";
  push @out,color 'bold' if $usecolor;
  push @out,"INSTANCE\t\tUSAGE\tHIT %\tCONN\tTIME\t";
  if ( $lifetime || $cumulative ) {
    push @out,"EVICT\t";
    push @out,"GETS\tSETS\t" if $commands;
    push @out,"READ\tWRITE\t" if $bytes;
    push @out,"\n";
  } else {
    push @out,"EVICT/s ";
    push @out,"GETS/s\tSETS/s\t" if $commands;
    push @out,"READ/s\tWRITE/s\t" if $bytes;
    push @out,"\n";
  }
  push @out,color 'reset' if $usecolor;

  my %tot;

  foreach my $key (@keys) {
    $tot{$key} = 0;
  }

  my $count = 0;

  foreach my $instance (@instances) {

    my ($port, $server);

    my @split = split(/:/,$instance);
    unless ( $split[1] ) {
      $instance = $instance . ":" . $default_port;
      $port = $default_port;
    }
    else {
      $port = $split[1];
    }

# Some exhaustive (exhausting?) logic to determine the ideal text to push @out,for
# the server name.
    if ( length($instance) > 22 ) {
      if ( $port ne $default_port ) {
        $server = substr($split[0],0,17) . ":" . $port;
      }
      else {
        if ( length($split[0]) < 18 ) {
          $server = $instance;
        }
        else {
          $server = substr($split[0],0,23);
        }
      }
    }
    elsif ( length($instance) < 8 ) {
      $server = "$instance\t\t";
    }
    elsif ( length($instance) < 16 ) {
      $server = "$instance\t";
    }
    else {
      $server = $instance;
    }

    my $t0 = time();

    $remote = IO::Socket::INET->new($instance);
    unless ( defined($remote) ) {
      push @out,color 'red' if $usecolor;
      push @out,$instance . " is DOWN.\n";
      $count++;
      push @out,color 'reset' if $usecolor;
      next;
    }

    $remote->autoflush(1);
    $count++;

    print $remote "stats\n";

    my (%stats, %outstats);

    foreach my $key (@keys) {
      $outstats{$key} = 0;
    }

    LINE: while ( defined ( my $line = <$remote> ) ) {
      last LINE if ( $line =~ /END/ );
      chomp $line;
      my @bits = split(' ',$line);
      $stats{$bits[1]} = $bits[2];
      next LINE;
    }

    close $remote;

    my $t1 = time();
    $outstats{time} = ($t1 - $t0) * 1000;

    if ( $lifetime || $cumulative) {
      foreach my $key ('cmd_get', 'cmd_set', 'get_hits', 'get_misses', 'evictions', 'bytes_read', 'bytes_written') {
        if ( $cumulative ) {
          if ( $i == 1 ) {
            $original{$instance}{$key} = $stats{$key};
          } else {
            $outstats{$key} = $stats{$key} - $original{$instance}{$key};
          }
        } else {
          $outstats{$key} = $stats{$key};
        }
      }
      $outstats{cache_hit} = ( $stats{get_hits} / $stats{cmd_get} ) * 100;
    } else {
      foreach my $key ('cmd_get', 'cmd_set', 'get_hits', 'get_misses', 'evictions', 'bytes_read', 'bytes_written') {
        if ( defined ( $laststats{$instance}{$key} ) ) {
          $outstats{$key} = ($stats{$key} - $laststats{$instance}{$key}) / $sleep;
        }
      }
      $outstats{cache_hit} = 0;
      if ( defined($outstats{get_misses}) && $outstats{get_misses} > 0 ) {
        $outstats{cache_hit} = ( $laststats{$instance}{get_hits} / $laststats{$instance}{cmd_get} ) * 100;
      }
    }

    $outstats{limit_maxbytes} = $stats{limit_maxbytes};
    $outstats{bytes} = $stats{bytes};
    $outstats{usage} = ( $stats{bytes} / $stats{limit_maxbytes} * 100 );
    $outstats{curr_connections} = $stats{curr_connections};

    if ( $cumulative ) {
      foreach my $key ('cmd_get', 'cmd_set', 'get_hits', 'get_misses', 'evictions', 'bytes_read', 'bytes_written') {
        $threshold{$key} = $threshold{$key} * $i if $threshold{$key};
      }
    }

    push @out,"$server\t";
    threshold_print( $outstats{usage}, $threshold{usage}, 1, 0, '%', '%.1f');
    threshold_print( $outstats{cache_hit}, $threshold{cache_hit}, 0, 0, '%', '%.1f');
    threshold_print( $outstats{curr_connections}, $threshold{curr_connections}, 1, 0, '', '%.0d');
    if ( $outstats{time} >= 1000 ) {
      threshold_print( $outstats{time}/1000, $threshold{time}/1000, 1, 0, 's', '%.2f');
    } else {
      threshold_print( $outstats{time}, $threshold{time}, 1, 0, 'ms', '%.1f');
    }
    threshold_print( $outstats{evictions}, $threshold{evictions}, 1, 0, '', '%.1f');
    if ( $commands ) {
      threshold_print( $outstats{cmd_get}, $threshold{cmd_get}, 1, 0, '', '%.0f');
      threshold_print( $outstats{cmd_set}, $threshold{cmd_set}, 1, 0, '', '%.0f');
    }
    if ( $bytes ) {
      threshold_print( $outstats{bytes_read}, $threshold{bytes_read}, 1, 0, '', '%.0f');
      threshold_print( $outstats{bytes_written}, $threshold{bytes_written}, 1, 0, '', '%.0f');
    }
    push @out,"\n";

    foreach my $key (@keys) {
      $tot{$key} = $tot{$key} + $outstats{$key};
    }

    unless ( $lifetime || $cumulative ) {
      foreach my $key ('cmd_get', 'cmd_set', 'get_hits', 'get_misses', 'evictions', 'bytes_read', 'bytes_written') {
        $laststats{$instance}{$key} = $stats{$key};
      }
    }

  }

  push @out,color 'bold' if $usecolor;
  push @out,"\nAVERAGE:\t\t";
  threshold_print( $tot{usage}/$count, $threshold{usage}, 1, 1, '%', '%.1f');
  threshold_print( $tot{cache_hit}/$count, $threshold{cache_hit}, 0, 1, '%', '%.1f');
  threshold_print( $tot{curr_connections}/$count, $threshold{curr_connections}, 1, 1, '', '%.0d');
  if ( ( $tot{time}/$count ) >= 1000 ) {
    threshold_print( ($tot{time}/$count)/1000, $threshold{time}/1000, 1, 1, 's', '%.2f');
  } else {
    threshold_print( $tot{time}/$count, $threshold{time}, 1, 1, 'ms', '%.1f');
  }
  threshold_print( $tot{evictions}/$count, $threshold{evictions}, 1, 1, '', '%.1f');
  if ( $commands ) {
    threshold_print( $tot{cmd_get}/$count, $threshold{cmd_get}, 1, 1, '', '%.0f');
    threshold_print( $tot{cmd_set}/$count, $threshold{cmd_set}, 1, 1, '', '%.0f');
  }
  if ( $bytes ) {
    threshold_print( $tot{bytes_read}/$count, $threshold{bytes_read}, 1, 1, '', '%.0f');
    threshold_print( $tot{bytes_written}/$count, $threshold{bytes_written}, 1, 1, '', '%.0f');
  }
  push @out,"\n";
  push @out,"\nTOTAL:\t\t";
  threshold_print( $tot{bytes}, $threshold{bytes}, 0, 1, 'B/', '%.0f');
  threshold_print( $tot{limit_maxbytes}, $threshold{limit_maxbytes}, 0, 1, "B\t", '%.0f');
  threshold_print( $tot{curr_connections}, $threshold{curr_connections}*$count, 1, 1, '', '%.0d');
  if ( $tot{time} >= 1000 ) {
    threshold_print( $tot{time}/1000, ($threshold{time}*$count)/1000, 1, 1, 's', '%.2f');
  } else {
    threshold_print( $tot{time}, $threshold{time}*$count, 1, 1, 'ms', '%.1f');
  }
  threshold_print( $tot{evictions}, $threshold{evictions}*$count, 1, 1, '', '%.1f');
  if ( $commands ) {
    threshold_print( $tot{cmd_get}, $threshold{cmd_get}*$count, 1, 1, '', '%.0f');
    threshold_print( $tot{cmd_set}, $threshold{cmd_set}*$count, 1, 1, '', '%.0f');
  }
  if ( $bytes ) {
    threshold_print( $tot{bytes_read}, $threshold{bytes_read}*$count, 1, 1, '', '%.0f');
    threshold_print( $tot{bytes_written}, $threshold{bytes_written}*$count, 1, 1, '', '%.0f');
  }
  push @out,color 'reset' if $usecolor;
  push @out,"\n(ctrl-c to quit.)\n";
  sleep($sleep);

  print @out;
  $i++;
}

################################################################################
# threshold_print
# takes two variables, compares them (greater then if $gt == 1), and then prints
# it.  It uses red as the default color for successful comparisons, but sets
# it to red bold if $bold == 1.  $trail specifies trailing characters to print.
# $sprintf lets you specify the format for sprintf().
#
sub threshold_print {

  my ($stat, $threshold, $gt, $bold, $trail, $sprintf) = @_;

  my $color = 'red';
  my $offcolor = 'reset';
  if ( $bold ) {
    $color = 'bold red';
    $offcolor = 'reset bold';
  }

  if ( $gt ) {
    if ( $stat > $threshold ) {
      push @out, color $color if $usecolor;
    }
  } else {
    if ( $stat < $threshold ) {
      push @out, color $color if $usecolor;
    }
  }

  if ( $stat > 999999999999 ) {
    $stat = $stat / (1024*1024*1024*1024);
    $trail = 'T' . $trail;
    $sprintf = '%.1f';
  } elsif ( $stat > 99999999 ) {
    $stat = $stat / (1024*1024*1024);
    $trail = "G" . $trail;
    $sprintf = '%.1f';
  } elsif ( $stat > 999999 ) {
    $stat = $stat / (1024*1024);
    $trail = 'M' . $trail;
    $sprintf = '%.1f';
  } elsif ( $stat > 9999 ) {
    $stat = $stat/1024;
    $trail = 'K' . $trail;
    $sprintf = '%.1f';
  }

  push @out,sprintf($sprintf,$stat) . $trail;
  push @out,color $offcolor if $usecolor;
  push @out,"\t";
}
################################################################################
