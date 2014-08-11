class Bike
#the initialize method is always called when you create a new
#class by typing Bike.new
	def initialize
		@broken = false
	end
	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end
end