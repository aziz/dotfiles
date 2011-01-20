require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Wirble for colorful IRB
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "*** wirble disabled ***"
  puts "gem install wirble"
end

# better table view for activerecord objects with hirb
begin
  require 'hirb'
  Hirb.enable
  extend Hirb::Console
rescue LoadError
  puts "*** hirb disabled ***"
  puts "gem install hirb"
end

begin
  require 'ap'
rescue LoadError
  puts "*** awesome_print disabled ***"
  puts "gem install awesome_print"
  require 'pp'
end

begin
  require 'looksee/shortcuts'
rescue LoadError
  puts "*** looksee disabled ***"
  puts "gem install looksee"
end


class Object

  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def ls(obj=self)
    width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
    width = 80 if width == 0
    local_methods(obj).each_slice(3) do |meths|
      pattern = "%-#{width / 3}s" * meths.length
      puts pattern % meths
    end
  end

  # print documentation
  # ri 'Array#pop' or Array.ri or Array.ri :pop or arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end

end

# quick benchmarking
# based on rue's irbrc => http://pastie.org/179534
def bm(repetitions=100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
  nil
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

def clear
  system 'clear'
end
alias c clear

# reload this .irbrc
def IRB.reload
  load __FILE__
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
