class UsersController < ApplicationController

	def show
	end

	private

	helper_method :current_user
	def current_user
		@curent_user = User.find(params[:id])
	end

end
