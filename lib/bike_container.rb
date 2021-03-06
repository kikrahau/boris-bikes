module BikeContainer
	DEFAULT_CAPACITY = 20

	def initialize (options = {})
		self.capacity = options.fetch(:capacity, capacity)
		raise RuntimeError if options.fetch(:bikes, []).length > self.capacity
		self.bikes = options.fetch(:bikes, [])
		
	end

	def bikes
		@bikes ||= []
	end

	def bikes=(value)
		@bikes = value
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock!(bike)
		#if capacity is reached, raise an exception
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike)
		raise "Bike is not there" unless bikes.include?(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end
	def empty?
		bike_count == 0
	end
	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end
	def broken_bikes
		bikes - available_bikes
	end
end