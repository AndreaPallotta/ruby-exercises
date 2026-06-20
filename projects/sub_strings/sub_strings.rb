def substrings(string, dictionary)
  dictionary.reduce({}) do |result, word|
    count = string.scan(Regexp.new(word, Regexp::IGNORECASE)).count
    if count > 0
      result[word] = count
    end
    result
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
