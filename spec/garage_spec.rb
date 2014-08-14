require 'garage'

describe Garage do

	it_behaves_like "bike container"


	let(:garage) {Garage.new(:capacity => 123)}
	let(:broken_bike) { Bike.new.break! }


	it "should allow setting default capacity on initialization" do
		expect(garage.capacity).to eq (123)
	end

	it "when docking, Bikes should be fixed" do
		garage.dock!(broken_bike)
		expect(broken_bike).not_to be_broken 
	end
end