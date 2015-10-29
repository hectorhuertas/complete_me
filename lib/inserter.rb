require_relative 'substring'
module Inserter

  attr_reader :substring
#   def refresh_data(substring, _node)
#     @Substring
#     @node
#     @letter = substring[0]
# end

  def letter
      remainderX[0]
  end

  def remainderX
    remainder = substring.sub(value, '')
  end

  def inserting_word?
    substring.sub(value, '').length
  end

  def mark_as_word
    links[letter].word=true
  end

  # def insert2(substring)
  #   @substring = substring
  #
  #   create_node
  #
  #   if inserting_word?
  #     mark_as_word
  #   elsif !substring.empty?
  #     insert(substring)
  #   end
  # end

  # def remainder(substring)
  #   substring.sub(value, '')
  # end

  def insert(substring)
    @substring = substring

    # remainder = remainder(substring)
    unless remainderX.empty?
      create_node
      # if inserting_word?
      #   mark_as_word
      # else
      #   insert(substring)
      # end

      @links[letter].insert(substring)
      @links[letter].word = true if remainderX.length == 1
    end
  end

def create_node
  @links[letter] ||= Substring.new(value + letter)
end


  ##Works well
  # def remainder(substring)
  #   substring.sub(value, '')
  # end
  #
  # def insert(substring)
  #   @substring = substring
  #
  #   remainder = remainder(substring)
  #   unless remainder.empty?
  #     @links[remainder[0]] ||= Substring.new(value + remainder[0])
  #     @links[remainder[0]].insert(substring)
  #     @links[remainder[0]].word = true if remainder.length == 1
  #   end
  # end
end
