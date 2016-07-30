if $dictionary.nil?
  $dictionary = {}
  File.open("/usr/share/dict/words") do |file|
    file.each do |line|
      $dictionary[line.strip] = true
    end
  end
end
