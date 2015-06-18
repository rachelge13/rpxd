class Player < ActiveRecord::Base
	belongs_to :user
	has_one :rank, :class_name => "Player"
	acts_as_votable
	acts_as_list



	def upvote(user)
		self.vote_by voter: user, :duplicate => true
		self.save
		self.move_higher
	end

end


