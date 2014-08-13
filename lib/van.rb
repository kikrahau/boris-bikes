require_relative 'bike_container'

class Van
	include BikeContainer
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def pick_up_broken_bikes!(station)
		station.broken_bikes.each do |broken_bike|
			station.release(broken_bike)
			dock!(broken_bike)
		end
	end

	def deliver_broken_bikes!(garage)
		broken_bikes.each do |broken_bike|
			release(broken_bike)
			garage.dock!(broken_bike)
		end
	end
end