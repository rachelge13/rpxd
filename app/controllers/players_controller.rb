class PlayersController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	def index
		@player1 = Player.order("RANDOM()").first
		@player2 = Player.where.not(:name => @player1.name).order("RANDOM()").first
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

	def show
		@player = Player.find(params[:id])
	end

	def upvote
		@player = Player.find(params[:id])
  		redirect_to root_path
	end

	def downvote
  		@player = Player.find(params[:id])
  		@player.downvote_from current_user
  		redirect_to root_path
	end

	private

	def player_params
		params.require(:player).permit(:name)
	end

end
