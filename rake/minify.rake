desc "finds and minifies all css files below current path using YUI-compressor rubygem"
task :minify_css do
  require 'find'
  begin
    require "yui/compressor"
  rescue LoadError
    puts "YUI compressor is not installed. run this command first:"
    puts "gem install yui-compressor"
  end
  
  compressor = YUI::CssCompressor.new
  
  Find.find(`pwd`.chop) do |file|
  
    next unless file =~ /(\.css)$/
    next if file =~ /(\.min\.css)$/
  
    new_path = file.split(".css")[0] + ".min.css"
    puts "compressing \"#{file.gsub(ENV["PWD"],"")}\" and saving as \"#{new_path.gsub(ENV["PWD"],"")}\""
  
    File.open(file, "r") do |cssfile|
      File.open(new_path, "w") do |mincssfile|
        mincssfile.puts compressor.compress(cssfile.read)
      end
    end

  end
end