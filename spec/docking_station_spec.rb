require 'docking_station'

describe Docking_Station do

let(:station) {Docking_Station.new(:capacity => 123)}

	it "should allow setting default capacity on initialization" do
		expect(station.capacity).to eq (123)
	end
end


