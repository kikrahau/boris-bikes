require_relative 'bike_container'

class Person

	def initialize
		@bike = false
	end

	def has_bike?
		@bike != false 
	end
	def receive!(bike)
		raise "Person already has a bike" if @bike
		@bike = bike
		self
	end
	def release!(bike)
		raise "Person has no bike to release" if !@bike
		@bike = false
	end
	def break_bike (bike)
		bike.break!
	end

	def collect_bike_from(station,bike)
		@bike = bike
	end

	def bike
		@bike
	end
end