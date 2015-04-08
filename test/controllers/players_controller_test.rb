require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
	test 'upvote' do 
		player = Player.create(:name => 'TEST')
		player.upvote
	assert_equal 1, player.votes.count
	end
end
end
