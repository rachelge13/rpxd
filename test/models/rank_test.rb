require 'test_helper'

class RankTest < ActiveSupport::TestCase

	test "In List" do 
		user = FactoryGirl.create(:user)
		player = Player.create(:name => 'TEST')
		rank = FactoryGirl.create(:rank)
		assert_equal true, player.in_list?
	end

	test "Rank" do
		user = FactoryGirl.create(:user)
		player = Player.create(:name => 'TEST')
		player2 = Player.create(:name => 'TEST2')
		player2.insert_at(2)
		player.move_lower
		player.save
		assert_equal 2, player.position
	end
end
