class Player < ActiveRecord::Base
	belongs_to :user
	acts_as_votable

	def upvote(user)

		self.vote_by voter: user, :duplicate => true
		self.save
	end

end


