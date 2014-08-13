require 'van'

describe Van do

let(:van) {Van.new(:capacity => 10)}

	it "should allow setting default capacity on initialization" do
		expect(van.capacity).to eq (10)
	end
	it "should collect broken bikes from station" do
		bike1 = Bike.new.break!
		bike2 = Bike.new.break!
		station = Docking_Station.new
		station.dock!(bike1)
		station.dock!(bike2)
		van.pick_up_broken_bikes!(station)
		expect(van.broken_bikes.count).to eq (2)
	end

	it "should deliver broken bikes to the garage" do
		bike1 = Bike.new.break!
		bike2 = Bike.new.break!
		garage = Garage.new
		van.dock!(bike1)
		van.dock!(bike2)
		van.deliver_broken_bikes!(garage)
		expect(van.broken_bikes).to eq []
		expect(garage.broken_bikes).to eq [bike1,bike2]
	end
end