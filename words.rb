#!/usr/bin/env ruby

words = []
File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    words << line.strip
  end
end

if ARGV.size == 0 || ARGV.size > 2
  puts "Usage: fword <letters> [regex]"
  exit 0
end
letters = ARGV[0]
if ARGV.size > 1
  a2 = ARGV[1].upcase
  re = Regexp.new(a2)
  words = words.select{|w| w =~ re}
  a2.each_char {|c| letters += c if c =~ /[A-Z]/}
end
s = letters.upcase.each_char.sort
