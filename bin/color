#! /usr/bin/env ruby

# encoding: UTF-8

# Display the colors available in a terminal.
puts "16-color mode:"
(0..16).each do |color|
  print "\033[38;5;%sm%s %03s\033[m" % [color.to_s, "x","#{color}"]
  puts if color % 16 == 0
end
puts

#Programs like ls and vim use the first 16 colors of the 256-color palette.
puts "256-color mode:"
c = [[16,21],[52,57],[88,93],[124,129],[160,160],[196,201],[232,237]]
c.each do |a|
  (a[0]..a[1]).each do |color|
    0.upto(5) do |i|
      print "\033[38;5;%sm%s %03s\033[m" % [(color+(i*6)).to_s, "x".force_encoding("UTF-8"),"#{(color+(i*6))%256}"]
    end
    puts
    
  end
end
puts