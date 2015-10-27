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
    refute substring.word?
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
    skip
    substring = Substring.new('p')
  end

  def test_it_finds_another_substring
    skip
    substring = Substring.new('p')
  end

  def test_it_does_not_find_a_fake_substring
    skip
    substring = Substring.new('p')
  end


end
