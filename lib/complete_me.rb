class CompleteMe
  attr_reader :links

  def initialize
    @links = {}
  end

  def insert(word)
    @links[word[0]] = Substring.new(word)
  end
end



# dictionary = File.read("/usr/share/dict/words")
# dictionary = dictionary.split.select{|word| word == 'pizza' }
# puts dictionary
