class Substring
  attr_reader :value, :links
  attr_accessor :word

  def initialize(value)
    @value = value.to_s
    @links = {}
  end

  def remainder(substring)
    substring.sub(value, '')
  end

  def insert(substring)
    remainder = remainder(substring)
    unless remainder.empty?
      @links[remainder[0]] ||= Substring.new(value + remainder[0])
      @links[remainder[0]].insert(substring)
      @links[remainder[0]].word = true if remainder.length == 1
    end
  end

  def find(substring)
    remainder = remainder(substring)
    return self if value == substring
    links[remainder[0]].find(substring) unless remainder.length == 0 || links[remainder[0]].nil?
  end

  def count
    me = word ? 1 : 0
    links.reduce(me) { |sum, element| sum + element[1].count }
  end

  def words
    if links.empty?
      return [value]
    else
      me = []
      me = [value] if word
      links.reduce(me) { |sum, x| sum + x[1].words }

    end
  end
end
