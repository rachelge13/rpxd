class Rank < ActiveRecord::Base
	has_many :players, order(position: :asc)
end
