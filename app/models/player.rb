class Player < ActiveRecord::Base
	belongs_to :user
	acts_as_votable

	def upvote
		(self.votes_for.size + 1) 
	end
end
