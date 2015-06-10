require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
	test 'upvote' do 
		player = Player.create(:name => 'TEST', :position => 15)
		user = FactoryGirl.create(:user)
		assert_difference 'player.get_upvotes.size' do
			player.upvote(user)
		end
	end

end
