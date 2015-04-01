require 'test_helper'

class UserTest < ActiveSupport::TestCase
  	test "show" do
  		expected = "The Joker"
  		actual = player.name.inspect
  		assert_equal expected, actual
  	end
end
