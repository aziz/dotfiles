# Rake task to automatically run something (i.e. specs) when code files are changed
# By Peter Çoopér
#
# Motivation: I couldn't get autotest to run on my Sinatra project for some reason but realized
# it didn't require overengineering. Just detect when a file is changed and then re-run the specs!
#
# Examples:
# # rake on_update "rake"
# # rake on_update "spec spec/user_spec.rb"
#
# Installation: Just add this Rake task into your Rakefile or whatever task inclusion system
# you have set up.
#
# License: Public domain.

desc "Automatically run something when code is changed"
task :on_update do
  require 'find'
  files = {}

  loop do
    changed = false
    Find.find(`pwd`.chop) do |file|
      next unless file =~ /(\.rb)|(\.html)|(\.js)|(\.css)|(\.tex)$/
      ctime = File.ctime(file).to_i

      if ctime != files[file]
        files[file] = ctime
        changed = true
      end
    end

    if changed
      system ARGV[1]
      puts "\nWaiting for a *.rb || *.js || *.css || *.html || *.tex   change"
    end

    sleep 1
  end
end