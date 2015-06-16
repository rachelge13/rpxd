class Rank < ActiveRecord::Base
	has_many :players, -> { order(position: :asc) }

	def rank_up
		self.move_higher
	end

	def rank_down
		self.move_lower
	end

end
