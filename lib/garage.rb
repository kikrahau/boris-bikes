require_relative 'bike_container'

class Garage
	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def fix_broken_bikes!
		bikes.each do |broken_bikes|
			broken_bikes.fix!
		end
	end
end