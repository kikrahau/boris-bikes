require_relative 'bike_container'

class Garage
	include BikeContainer

	# def fix_broken_bikes!
	# 	bikes.each do |broken_bikes|
	# 		broken_bikes.fix!
	# 	end
	# end

	def dock!(bike)
		super
		bike.fix!
	end
end