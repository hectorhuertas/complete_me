class Substring
  attr_reader :value, :links

  def initialize(value)
    @value = value.to_s
    @links = {}
  end

  def word?
    false
  end

  def insert(substring)
    p substring

      p remains = substring.sub(value,'')
      if !remains.empty?
        @links[remains[0]] ||=Substring.new(value + remains[0])
        @links[remains[0]].insert(substring)
      end
  end
end
