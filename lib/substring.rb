class Substring
  attr_reader :value, :links

  def initialize(value)
    @value = value.to_s
    @links = {}
  end

  def remainder(substring)
    substring.sub(value, '')
  end

  def word?
    false
  end

  def insert(substring)
    unless remainder(substring).empty?
      @links[remainder(substring)[0]] ||= Substring.new(value + remainder(substring)[0])
      @links[remainder(substring)[0]].insert(substring)
    end
  end

  def find(substring)
    remainder = remainder(substring)
    return self if value == substring
    links[remainder[0]].find(substring) unless remainder.length == 0 || links[remainder[0]].nil?
  end
end
