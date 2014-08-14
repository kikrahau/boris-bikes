require 'person'

describe Person do

	it_behaves_like "bike container"
	let(:bike) {Bike.new}
	let(:person_with_bike) {Person.new(bike: [bike])}	
	let(:person) {Person.new}

	it "should have no bike at initialization" do
		expect(person).not_to have_bike
	end
	it "should be able to get a bike" do 
		person.dock!(bike)
		expect(person).to have_bike
	end

	it "should be able to return a bike" do
		person_with_bike.dock!(bike)
		person_with_bike.release(bike)
		expect(person_with_bike).not_to have_bike
	end
end