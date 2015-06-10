class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :rank
	acts_as_votable
	acts_as_list scope: :rank



	def upvote (user)
		self.vote_by voter: user, :duplicate => true
		self.save
	end


end


