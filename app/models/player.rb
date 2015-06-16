class Player < ActiveRecord::Base
	has_one :user, :class_name => "Player"
	has_one :rank, :class_name => "Player"
	acts_as_votable
	acts_as_list



	def upvote
		self.vote_by  voter: user, :duplicate => true
		self.save
		self.move_higher
	end

end


