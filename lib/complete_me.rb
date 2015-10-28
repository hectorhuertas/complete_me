require_relative 'substring'

class CompleteMe
  attr_reader :links

  def initialize
    @links = {}
  end

  def initialize_link(letter)
    @links[letter] ||= Substring.new(letter)
  end

  def insert(word)
    initialize_link(word[0])

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
    # links.reduce(0) { |sum, element| sum + element[1].count }
    links.values.map(&:count).reduce(0,:+)
  end

  def populate(dictionary)
    dictionary.split.each { |word| insert(word.downcase) }
  end

  def suggest(substring)
    find(substring).words
  end

  def select(substring, word)
    find(substring).favorite(word)
  end
end
