require 'person'

describe Person do

	let(:bike) {Bike.new}
	let(:person_with_bike) {Person.new(bikes: [bike])}	
	let(:person) {Person.new}

	it "should be able to be created with a bike" do 
		expect(person_with_bike).to have_bike
	end

	it "should have no bike at initialization" do
		expect(person).not_to have_bike
	end

	it "should be able to get a bike" do 
		person.dock!(bike)
		expect(person).to have_bike
	end

	it "should be able to return a bike" do
		person_with_bike.release(bike)
		expect(person_with_bike).not_to have_bike
	end

	it "should not be able to have more than one bike" do 
		expect{ person_with_bike.dock!(bike) }.to raise_error RuntimeError
	end


end