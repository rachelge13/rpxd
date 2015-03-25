class PlayersController < ApplicationController
	def index
		@player = Player.order("RANDOM()").first
		@player2 = Player.order("RANDOM()").first
	end

	def new
		@player = Player.new
	end

	def create
		Player.create(player_params)
		redirect_to root_path
	end

	def player_params
		params.require(:player).permit(:name)
	end
end
