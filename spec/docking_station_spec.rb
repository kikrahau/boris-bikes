require 'docking_station'

describe DockingStation do

	it_behaves_like "bike container"

	let(:station) {DockingStation.new(:capacity => 123)}

	it "should allow setting default capacity on initialization" do
		expect(station.capacity).to eq (123)
	end
end


