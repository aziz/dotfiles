# what are the gems you use daily in REPL? Put them in ___daily_gems
___daily_gems  = %w[benchmark yaml json]

# ___pry_gems is for loading vendor plugins for Pry.
___pry_gems = %w[awesome_print hirb sketches byebug pry-stack_explorer]


module PryrcHelpers
  extend self

  ## this is a randomly-chosen numerics
  def pryrc_speed
    0.008 * [*1..5].sample
  end

  ## Interpret time (in seconds) to human-readable hash.
  # These numbers are took by Google Search
  # Google: How many seconds in X
  # where X is year, month, day...etc.
  def interpret_time time
    year = 31_556_926
    month = 2_629_743.83
    day = 86400
    hour = 3600
    min = 60
    sec = 1
    res = { year: 0, month: 0, day: 0, hour: 0, minute: 0, second: 0 }
    units = res.keys # = [:year, :month, :day, :hour, :minute, :second]
    [year, month, day, hour, min, sec].each_with_index do |unit, index|
      ## Divide by unit, set the quotient and remainder accordingly.
      # if time = 1200 seconds,
      # time.divmod unit will evaluates to
      # 1201/31_556_926 = 0..1201
      # which yields { :year => 0 }.
      # repeat with time = 1200 seconds and next unit, which is month.
      res[units[index]], time = time.divmod unit
    end
    ## delete time unit with zero because won't need to print
    # 0 days 1 hour 30 minutes, just print 1 hour 30 minutes.
    # 0 second is left for a special case:
    # interpreted_time = 'ever' if interpreted_time == '0 second'
    time_to_s res.delete_if { |key, val| val.zero? if key != :second }
  end

  ## Add color to terminal text.
  # \033 is 100% POSIX compatible. Use \e is also fine.
  # http://www.termsys.demon.co.uk/vtansi.htm
  # Foreground Colours
  #   30  Black
  #   31  Red
  #   32  Green
  #   33  Yellow
  #   34  Blue
  #   35  Magenta
  #   36  Cyan
  #   37  White
  def colorize(text, color_code)
    "\033[#{color_code}m#{text}\033[0m"
  end

  private

  ## Covert human-readable time hash to string.
  # { year: 3, month: 4, day: 15 } will result in
  # => "3 years 4 months 15 days"
  def time_to_s time_hash
    suffix = ''
    result = ''
    time_hash.each_pair do |unit, value|
      suffix = 's' if value > 1
      result << "#{value} #{unit}#{suffix} "
    end
    result.strip! # Remove last whitespace in "3 years 4 months 15 days ".
  end
end

# ==================
# Monkey Patches
# ==================

class Array

  ## Require many gems at once.
  # Input: array of gems' name
  # The side effect is requiring all of them.
  def ___require_gems
    missing = []
    self.each do |e|
      begin
        require e
      rescue LoadError => err
        missing << e
      end
    end
    if !missing.empty?
      puts 'Missing ' + missing.join(' ') + ' goodies :('
    end
  end

  ## Generate a toy of array to play with.
  # Array.toy => [1,2,3,4,5,6,7,8,9,10]
  # Array.toy { |i| i ** 2 }
  # => [0,1,4,9,16,25,36,49,64,81]
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i+1 }
  end
end

class Hash

  ### Generate a toy of hash to play with.
  # Hash.toy 3
  # => { 1 => "a", 2 => "b", 3 => "c" }
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96+(c+1)).chr })]
  end
end

class Object

  ## Open file with exact location via editor of your choice.
  # Defaults to Sublime Text.
  def subl(method_name, editor='subl')
    file, line = method(method_name).source_location
    `"#{editor}" "#{file}:#{line}"`
  end

  ## Only return the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end

  ## Safely require gem with message when a LoadError is signaled.
  def safe_require(r_gem, msg)
    begin
      require r_gem
    rescue LoadError
      puts "No #{r_gem} available."
      puts msg
    end
  end
end

# ==============================
#   Helpers!
# ==============================

## Pry.active_sessions
class Pry
  class << self
    attr_accessor :active_sessions
  end
end

## YAML#to_yaml abstraction.
# y("language: ruby\nrvm:\n  - 2.0.0\n  - 1.9.3\nscript: rake test\n")
# =>
# --- |
#   language: ruby
#   rvm:
#     - 2.0.0
#     - 1.9.3
#   script: rake test
def y(obj)
  puts obj.to_yaml
end

### Benchmark

## Benchmark.measure abstraction.
# puts bm { "a"*1_000_000_000 }
def bm(&block)
  Benchmark.measure &block
end

# ___ is to Avoid name conflict
___ = PryrcHelpers

___daily_gems.___require_gems
___pry_gems.___require_gems

# ==============================
#  Vendor Stuff
# ==============================

# ============================
#   hirb
# ============================
if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end
  Hirb.enable
end

# ==============================
#   Awesome Print
# ==============================
if defined? AwesomePrint
  AwesomePrint.pry!
  ## The following line enables awesome_print for all pry output,
  # and enables paging using Pry's pager with awesome_print.
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai(indent: 2)}", output)}
  ## If you want awesome_print without automatic pagination, use below:
  # Pry.config.print = proc { |output, value| output.puts value.ai }

  ## Evaluated result display inline
  # Pry.config.print = lambda { |output, value| output.print "\e[1A\e[18C # => "; output.puts value.inspect }

  ## if in bundler, break out, so awesome print doesn't have to be in Gemfile
  # if defined? Bundler
  #   Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  #   Gem::Specification.reset
  #   load 'rubygems/custom_require.rb'
  # end

  ## awesome_print config for Minitest.
  if defined? Minitest
    module Minitest::Assertions
      def mu_pp(obj)
        obj.awesome_inspect
      end
    end
  end
end # End of AwesomePrint

# ==============================
#   Pry Configurations
# ==============================

# History (Use one history file)
Pry.config.history.file = "~/.irb_history"

# Editors
Pry.config.editor = "subl"

# ==============================
#   Pry Prompt
# ==============================
# with AWS:
#             AWS@2.0.0 (main)>
# with Rails:
#             3.2.13@2.0.0 (main)>
# Plain Ruby:
#             2.0.0 (main)>
Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "AWS@" if defined?(AWS)
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end

# Exception
Pry.config.exception_handler = proc do |output, exception, _|
  puts ___.colorize "#{exception.class}: #{exception.message}", 31
  puts ___.colorize "from #{exception.backtrace.first}", 31
end

# Handy hotkeys for debugging!
if defined?(PryDebugger)
  Pry.config.commands.alias_command 'c', 'continue'
  Pry.config.commands.alias_command 's', 'step'
  Pry.config.commands.alias_command 'n', 'next'
  Pry.config.commands.alias_command 'f', 'finish'
end

# ==============================
#   Customized hotkeys for Pry
# ==============================
# Ever get lost in pryland? try w!
Pry.config.commands.alias_command 'w', 'whereami'
# Clear Screen
Pry.config.commands.alias_command '.cls', '.clear'

alias :r :require
alias :l :load

### Copy to clipboard!

# ==============================
#   pbcopy
# ==============================
# Create command 'pbcopy' : Copy the last returned value in the Mac OS clipboard
# options : -m : Multiline copy
# Usage :
#         a => [1, 2, 3]
#         pbcopy
#         [1, 2, 3]
#         pbcopy -m
#          [
#           1,
#           2,
#           3,
#          ]
if RUBY_PLATFORM =~ /darwin/i # OSX only.
  # The pbcopy manual page for Mac OS X
  # http://goo.gl/o3nGsr
  def pbcopy(str, opts = {})
    IO.popen('pbcopy', 'r+') { |io| io.print str }
  end

  Pry.config.commands.command "pbcopy", "Copy last returned object to clipboard, -m for multiline copy" do

    multiline = arg_string == '-m'
    pbcopy _pry_.last_result.ai(:plain => true,
                                :indent => 2,
                                :index => false,
                                :multiline => multiline)
    output.puts "Copied #{multiline ? 'multilined' : ''}!"
  end

  Pry.config.commands.alias_command 'cp', 'pbcopy'
end

# ==============================
#   Rails
# ==============================
if defined?(Rails)
  begin
    require "rails/console/app"
    require "rails/console/helpers"
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
