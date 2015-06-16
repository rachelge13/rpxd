require 'test_helper'

class RankTest < ActiveSupport::TestCase

	test "Rank" do 
		user = FactoryGirl.create(:user)
		player = Player.create(:name => 'TEST')
		rank = FactoryGirl.create(:rank)
		assert_equal true, player.in_list?
	end
end
