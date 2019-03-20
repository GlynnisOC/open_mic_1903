require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User.new("Sal")
  end

  def test_it_exists
    assert_instance_of Joke, @joke
  end

  def test_it_has_attributes
    assert_equal "Sal", @sal.name
  end

  def test_user_starts_with_no_jokes
    assert_equal [], @sal.jokes
  end

  def test_user_now_has_some_jokes
    @sal.learn(@joke)
    @sal.learn(@joke_2)
    assert_equal [@joke, @joke_2], @sal.jokes
  end
end
