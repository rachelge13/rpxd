require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

	test "Upvote" do 
		user = FactoryGirl.create(:user)
		player = Player.create(:name => 'TEST')
		assert_difference 'player.get_upvotes.size' do
			player.upvote(user)
		end
	end

end
