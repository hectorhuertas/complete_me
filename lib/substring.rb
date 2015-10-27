class Substring
  attr_reader :value

  def initialize(value)
    @value = value.to_s
  end

  def word?
    false
  end
end
