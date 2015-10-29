require_relative 'substring'

module Inserter
  attr_reader :substring

  def insert(substring)
    @substring = substring
    create_node
    insert_substring
  end

  def insert_substring
    if inserting_word?
      mark_as_word
    else
      links[letter].insert(substring)
    end
  end

  def remainder
    remainder = substring.sub(value, '')
  end

  def letter
    remainder[0]
  end

  def inserting_word?
    remainder.length == 1
  end

  def mark_as_word
    links[letter].word = true
  end

  def create_node
    @links[letter] ||= Substring.new(value + letter)
  end
end
