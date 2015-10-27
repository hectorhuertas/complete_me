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

end
