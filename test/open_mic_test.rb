require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class OpenMicTest < Minitest::Test

  def setup
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
  end

  def test_it_exists
    assert_instance_of OpenMic, @open_mic
  end

  def test_it_has_attributes
    assert_equal "Comedy Works", @open_mic.location
    assert_equal "11-20-18", @open_mic.date
  end

  def test_it_begins_without_performers
    assert_equal [], @open_mic.performers
  end

  def test_it_welcomes_performers
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_user_does_not_tell_repeated_jokes
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    assert_equal false, @open_mic.repeated_jokes?
  end

  def test_repeated_jokes_now_returns_true_as_one_user_told_same_joke
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @ali.tell(@sal, @joke_1)
    # require 'pry'; binding.pry
    assert_equal true, @open_mic.repeated_jokes?
  end
end
