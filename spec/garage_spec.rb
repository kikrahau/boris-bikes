require 'garage'

describe Garage do

	it_behaves_like "bike container"


	let(:garage) {Garage.new(:capacity => 123)}

	it "should allow setting default capacity on initialization" do
		expect(garage.capacity).to eq (123)
	end

	it "should fix bikes" do
		bike1 = Bike.new.break!
		bike2 = Bike.new.break!
		garage.dock!(bike1)
		garage.dock!(bike2)
		garage.fix_broken_bikes!
		expect(garage.broken_bikes.count).to eq (0)
		expect(garage.available_bikes.count).to eq (2)
	end
end