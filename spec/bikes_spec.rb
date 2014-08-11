require 'bikes'
#we're describing the functionality of a specific class, Bike
describe Bike do 
	#this is a specific feature
	#that we expect to present
	it 'should not be broken after we create it' do
		bike = Bike.new
		expect(bike).not_to be_broken
	end

	it "should be able to break" do 
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end

	it "should be able to get fixed" do
		bike = Bike.new
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
end
