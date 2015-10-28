require_relative 'substring'

class CompleteMe
  attr_reader :links

  def initialize
    @links = {}
  end

  def insert(word)
    @links[word[0]] ||= Substring.new(word[0])
    if word.length == 1
      links[word[0]].word = 1
    else
      links[word[0]].insert(word)
    end
  end

  def find(substring)
    @links[substring[0]].find(substring)
  end

  def count
    links.reduce(0){|sum,element| sum + element[1].count}
  end

  def populate(dictionary)
    dictionary.split.each {|word| insert(word.downcase)}
  end

  def suggest(hint)
    links[hint[0]].suggest(hint)
  end
end

# dictionary = File.read("/usr/share/dict/words")
# dictionary = dictionary.split.select{|word| word == 'pizza' }
# puts dictionary
