desc "Creates a scaffold for making pure HTML & CSS templates"
task :ui_scaffold do
  wd = `pwd`.chop + ARGV[1]
  system("mkdir #{ARGV[1]} && cd #{ARGV[1]} && touch index.html && mkdir images && mkdir stylesheets && cd stylesheets & touch index.css")  
end