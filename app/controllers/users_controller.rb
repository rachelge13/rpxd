class UsersController < ApplicationController

	def show
		@player = Player.find(params[:id])
		@user = User.find(params[:id])
	end

	private

	helper_method :current_user
	def current_user
		@curent_user ||= User.find(params[:id])
	end

end
