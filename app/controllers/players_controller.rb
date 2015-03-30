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
		@player = current_user.players.create(player_params)
		if @player.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def player_params
		params.require(:player).permit(:name)
	end

	def show
	end
end
