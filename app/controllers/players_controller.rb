class PlayersController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :destroy]

	def index
		@players = Player.order("name")

	end

	def vote
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
		@player = current_player
	end

	def destroy
		@player = current_player
		if @player.user != current_user
		redirect_to :back, :alert => "Nice try, but this isn't your player!"
		end
		@player.destroy

	end

	def upvote
		@player = Player.find(params[:player_id])
		@player.save
		@player.vote_by voter: current_user, :duplicate => true
  		redirect_to root_path
	end

	def downvote
  		@player = current_player
  		@player.downvote_from current_user
  		redirect_to root_path
	end

	private

	def player_params
		params.require(:player).permit(:name)
	end

	helper_method :current_player
	def current_player
		@current_player ||= Player.find(params[:id])
	end



end
