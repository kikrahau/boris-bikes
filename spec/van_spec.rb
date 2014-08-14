require 'van'
require 'docking_station'

describe Van do

	it_behaves_like "bike container"


	let(:van)         { Van.new(:capacity => 10)}
	let(:broken_bike) { Bike.new.break! }
	let(:station)     { Docking_Station.new(bikes: [broken_bike]) }
	let(:garage)      { Garage.new }

	it "should allow setting default capacity on initialization" do
		expect(van.capacity).to eq (10)
	end

	it "should collect broken bikes from station" do
		van.pick_up_broken_bikes!(station)
		expect(van.broken_bikes.count).to eq (1)
	end

	it "should deliver broken bikes to the garage" do
		van.dock!(broken_bike)
		van.deliver_broken_bikes!(garage)
		expect(garage.bikes).to eq [broken_bike]
	end
end