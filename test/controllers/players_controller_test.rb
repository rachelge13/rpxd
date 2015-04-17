require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
	test 'upvote' do 
		player = Player.create(:name => 'TEST')
		player.upvote
	assert_equal 1, player.votes.count
	end

  	 test "Delete" do
  	 	user = FactoryGirl.create(:user)
  	 	player = FactoryGirl.create(:player, :user => user)
  	 	sign_in user
  		assert_difference 'Player.count', -1  do
  		delete :destroy, :id => player.id
  				
  	 end
  	end
end
