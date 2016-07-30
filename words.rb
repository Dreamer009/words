#!/usr/bin/env ruby

words = {}
File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    words[line.strip.upcase] = true
  end
end

if ARGV.size == 0 || ARGV.size > 1
  puts "Usage: words <letters>"
  exit 0
end
letters = ARGV[0].upcase
(1..letters.length).to_a.each do |i|
  letters.chars.combination(i).to_a.uniq.each do |p|
    pw = p.join
    #puts "word is " + pw
    if words[pw]
      puts pw
    end
  end
end
