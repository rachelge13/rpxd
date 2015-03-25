class PlayersController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	def index
		@player = Player.order("RANDOM()").first
		@player2 = Player.where.not(:name => @player.name).order("RANDOM()").first
	end

	def new
		@player = Player.new
	end

	def create
		current_user.player.create(player_params)
		redirect_to root_path
	end

	def player_params
		params.require(:player).permit(:name)
	end
end
