require 'minitest'
require 'complete_me'

class CompleteMeTest < Minitest::Test
  def test_it_exists
    assert CompleteMe
  end

  def test_it_inserts_a_single_character_substring
    complete_me = CompleteMe.new
    complete_me.insert('a')
    assert_equal 'a', complete_me.links['a'].value
  end

  def test_it_inserts_other_single_character_substring
    complete_me = CompleteMe.new
    complete_me.insert('b')
    assert_equal 'b', complete_me.links['b'].value
  end

  

  # def test_it_does_not_recognises_non_existant_words
  #   skip
  #   complete_me = CompleteMe.new
  #   refute complete_me.include?('laskng')
  # end
  #
  # def test_it_inserts_child_words
  #   skip
  #   complete_me = CompleteMe.new
  #   complete_me.insert('p')
  # end
  #
  # def test_it_stores_links_to_every_single_letter_on_the_alphabet
  #   skip
  #   complete_me = CompleteMe.new
  #   expected = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  #   actual = complete_me.links.values
  #   assert_equal expected, actual
  # end
  #
  # def test_it_holds_links_to_next_substrigns
  #   complete_me = CompleteMe.new
  #   # complete_me.
  # end
  #
  # def test_it_inserts_a_single_letter_word_on_its_index
  #   skip
  #   complete_me = CompleteMe.new
  #   input = 'a'
  #   expected = 'a'
  #   complete_me.insert('a')
  #   actual = complete_me.links
  #   assert_equal expected, actual
  # end
  #
  # def test_it_inserts_a_single_word
  #   skip
  #   complete_me = CompleteMe.new
  #   input = 'pizza'
  #   expected
  #   # actual = complete_me.
  #   assert_equal expected, actual
  # end
  #
  # def test_it_inserts_another_word
  #   skip
  #   complete_me = CompleteMe.new
  #   input
  #   expected
  #   actual
  #   assert_equal expected, actual
  # end
  #
  # def test_it_inserts_a_word_that_is_substring_of_an_existing_one
  #   skip
  #   complete_me = CompleteMe.new
  #   input
  #   expected
  #   actual
  #   assert_equal expected, actual
  # end

end
