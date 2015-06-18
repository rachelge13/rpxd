require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
	
  test "Upvote" do
		user = FactoryGirl.create(:user) 
		player = Player.create(:name => 'TEST')
		sign_in user
		player.upvote(user)
	  	assert_equal 1, player.get_upvotes.size
	end

  test "Delete" do
  		user = FactoryGirl.create(:user)
  		player = FactoryGirl.create(:player, :user => user)
	 	sign_in user
		assert_difference 'Player.count', -1  do
		  delete :destroy, :id => user.id 
		end				
  	end

end
