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

  def test_it_finds_single_char_words
    complete_me = CompleteMe.new
    complete_me.insert('b')
    assert 'b', complete_me.find('b').value
  end

  def test_it_finds_several_char_words
    complete_me = CompleteMe.new
    complete_me.insert('balance')
    assert complete_me.find('balance')
  end

  def test_it_inserts_single_char_words
    complete_me = CompleteMe.new
    complete_me.insert('b')
    assert complete_me.find('b')
  end

  def test_it_inserts_several_char_words
    complete_me = CompleteMe.new
    complete_me.insert('balance')
    assert complete_me.find('balance').word
  end

  def test_first_substring_does_not_always_becomes_a_word
    complete_me = CompleteMe.new
    complete_me.insert('balance')
    refute complete_me.find('b').word
  end

  def test_word_count_starts_0
    complete_me = CompleteMe.new
    assert_equal 0, complete_me.count
  end

  def test_it_counts_words
    complete_me = CompleteMe.new
    input = %w(b ball char super supermonkey)
    input.each { |word| complete_me.insert(word) }
    assert_equal 5, complete_me.count
  end

  def test_it_populates_the_dictionary_from_a_newline_separated_list_of_words
    complete_me = CompleteMe.new
    input = "b\nball\nchar\nsuper\nsupermonkey"
    complete_me.populate(input)
    assert_equal 5, complete_me.count
  end

  def test_it_suggests_words_from_first_letter
    complete_me = CompleteMe.new
    input = %w(b ball char super supermonkey superman salt soup)
    input.each { |word| complete_me.insert(word) }
    expected = %w(super supermonkey superman salt soup)
    assert_equal expected, complete_me.suggest('s')
  end

  def test_it_suggests_words_from_first_letter
    complete_me = CompleteMe.new
    input = %w(b ball char super supermonkey superman salt soup)
    input.each { |word| complete_me.insert(word) }
    expected = %w(super supermonkey superman)
    assert_equal expected, complete_me.suggest('su')
  end

  def test_it_selects_favorite_predictions_for_a_substring
    complete_me = CompleteMe.new
    input = %w(b ball char super supermonkey superman salt soup)
    input.each { |word| complete_me.insert(word) }
    complete_me.select('su', "superman")
    expected = {'superman' => 1}
    assert_equal expected, complete_me.find('su').favorites
  end
end
