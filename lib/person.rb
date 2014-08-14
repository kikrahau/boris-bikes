require_relative 'bike_container'

class Person

	def initialize
		@bike = []
	end

	def has_bike?
		@bike.any?
	end
	def get_bike! (bike)
		@bike << bike
	end
end