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

# test remainder?
end
