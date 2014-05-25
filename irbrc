require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

begin
  require 'awesome_print'
rescue LoadError
  puts "* awesome_print disabled `gem install awesome_print`"
  require 'pp'
end

class Object

  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
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
    b.report { repetitions.times(&block) }
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
