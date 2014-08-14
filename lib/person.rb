require_relative 'bike_container'

class Person
	include BikeContainer

	def has_bike?
		@bikes.any?
	end
end