require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
	test 'upvote' do 
		player = Player.create(:name => 'TEST')
		player.upvote
	assert_difference 'Players.count' do
		post :vote
	end
end
end
