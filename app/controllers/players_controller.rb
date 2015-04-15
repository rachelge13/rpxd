class PlayersController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@players = Player.order("name")

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
		@player1 = Player.order("RANDOM()").first
		@player2 = Player.where.not(:name => @player1.name).order("RANDOM()").first	
	end

	def destroy
		@player = Player.find(params[:player_id])
		if @player.user != current_user
		return render :text => 'This is not your player.', :status => :forbidden
		end
		@comment.destroy
		redirect_to user_path(@user)
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
		@current_player ||= Player.find(params[:player_id])
	end



end
