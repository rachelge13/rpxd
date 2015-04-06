require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  	test "user profile" do
  		expected = "The Joker"
  		actual = player.name.inspect
  		assert_equal expected, actual
  	end
end
