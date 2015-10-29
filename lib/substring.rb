require_relative 'inserter'

class Substring
  include Inserter
  attr_reader :value, :links, :favorites
  attr_accessor :word

  def initialize(value)
    @value = value.to_s
    @links = {}
    @favorites = {}
  end

  def find(substring)
    return self if value == substring
    remainder = substring.sub(value, '')
    links[remainder[0]].find(substring) unless remainder.length == 0 || links[remainder[0]].nil?
  end

  def count
    self_count = word ? 1 : 0
    # links.reduce(me) { |sum, element| sum + element[1].count }
    links.values.map(&:count).reduce(self_count,:+)
  end

  def words
    if links.empty?
      return [value]
    else
      words = favorites.keys
      words << value if word
      links.values.map(&:words).reduce(words,:+).uniq
    end
  end

  def favorite(word)
      @favorites[word] ||= 0
      @favorites[word] +=1
  end
end
