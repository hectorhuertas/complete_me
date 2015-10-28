require 'minitest'
require 'substring'

class SubstringTest < Minitest::Test
  def test_it_exists
    assert Substring
  end

  def test_it_is_created_with_a_value
    substring = Substring.new('a')
    assert_equal 'a', substring.value
  end

  def test_it_is_created_with_another_value
    substring = Substring.new('b')
    assert_equal 'b', substring.value
  end

  def test_its_value_is_always_a_string
    substring = Substring.new(6)
    assert_equal '6', substring.value
  end

  def test_it_is_not_a_word_by_default
    substring = Substring.new('a')
    refute substring.word
  end

  def test_it_inserts_new_substring_at_correct_link
    substring = Substring.new('p')
    substring.insert('pi')
    assert_equal 'pi', substring.links['i'].value
  end

  def test_it_inserts_other_substring_at_correct_link
    substring = Substring.new('p')
    substring.insert('po')
    assert_equal 'po', substring.links['o'].value
  end

  def test_it_inserts_longer_substring_at_correct_link
    substring = Substring.new('p')
    substring.insert('piz')
    assert_equal 'piz', substring.links['i'].links['z'].value
  end

  def test_if_finds_a_substring
    substring = Substring.new('p')
    substring.insert('pizzeria')
    assert_equal 'pizze', substring.find('pizze').value
    assert_equal 'pi', substring.find('pi').value
    assert_equal 'pizzeri', substring.find('pizzeri').value
    assert_equal 'pizzeria', substring.find('pizzeria').value
  end

  def test_it_finds_another_substring
    substring = Substring.new('c')
    substring.insert('carpool')
    assert_equal 'car', substring.find('car').value
    assert_equal 'carpo', substring.find('carpo').value
  end

  def test_it_does_not_find_a_fake_substring
    substring = Substring.new('p')
    substring.insert('pal')
    refute substring.find('pad')
    refute substring.find('palindrome')
  end

  def test_it_inserts_word_substrings_as_words
    substring = Substring.new('p')
    substring.insert('pizza')
    assert substring.find('pizza').word
  end

  def test_words_substrings_are_not_words
    substring = Substring.new('p')
    substring.insert('pizza')
    refute substring.find('piz').word
    refute substring.find('pi').word
  end

  def test_it_counts_words
    substring = Substring.new('p')
    substring.insert('pizzeria')
    substring.insert('pizza')
    substring.insert('pizzicato')
    assert_equal 3, substring.count
  end

  def test_it_counts_itself_if_its_a_words
    substring = Substring.new('p')
    substring.word = true
    substring.insert('pizzeria')
    substring.insert('pizza')
    substring.insert('pizzicato')
    assert_equal 4, substring.count
  end

  def test_it_returns_single_word
    substring = Substring.new('p')
    substring.insert('pizza')
    assert_equal ['pizza'], substring.words
  end

  def test_it_returns_possible_words
    substring = Substring.new('p')
    substring.insert('pizzeria')
    substring.insert('pizza')
    substring.insert('pizzicato')
    expected = %w(pizzeria pizza pizzicato)
    assert_equal expected, substring.words
  end

  def test_it_favorites_a_word_for_a_substring
    substring = Substring.new('su')
    substring.favorite("superman")
    expected = {'superman' => 1}
    assert_equal expected, substring.favorites
  end

  def test_it_favorites_other_word_for_a_substring
    substring = Substring.new('su')
    substring.favorite("super")
    expected = {'super' => 1}
    assert_equal expected, substring.favorites
    end

  def test_it_favorites_several_words_for_a_substring
    substring = Substring.new('su')
    substring.favorite("super")
    substring.favorite("superbob")
    expected = {'super' => 1, 'superbob' =>1}
    assert_equal expected, substring.favorites
  end

  def test_it_favorites_a_word_several_times
    substring = Substring.new('su')
    substring.favorite("super")
    substring.favorite("super")
    expected = {'super' => 2}
    assert_equal expected, substring.favorites
  end

  def test_it_returns_favorites_in_descending_order
    substring = Substring.new('su')
    substring.favorite("super")
    substring.favorite("superbob")
    substring.favorite("superbob")
    expected = {'superbob' =>2, 'super' => 1}
    assert_equal expected, substring.favorites
  end

  def test_it_returns_other_favorites_in_descending_order
    substring = Substring.new('su')
    substring.favorite("super")
    substring.favorite("super")
    substring.favorite("super")
    substring.favorite("superbob")
    substring.favorite("superbob")
    expected = { 'super' => 3,'superbob' =>2}
    assert_equal expected, substring.favorites
  end

  def test_words_return_favorites_words_first
    substring = Substring.new('p')
    substring.word = true
    substring.insert('pizzeria')
    substring.insert('pizza')
    substring.insert('pizzicato')
    substring.favorite('pizza')
    expected = %w(pizza p pizzeria pizzicato)
    assert_equal expected, substring.words
  end

# test remainder?
end
