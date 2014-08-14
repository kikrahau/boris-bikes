require 'person'

describe Person do

	let(:bike) { Bike.new }
	let(:person) { Person.new}

	it "should not have a bike at the beginning" do
		expect(person).not_to have_bike
	end

	it "should be able to recive a bike" do 
		person.get_bike!(bike)
		expect(person).to have_bike
	end

	it "should be able to return a bike" do
		person.get_bike!(bike)
		person.return_bike!(bike)
		expect(person).not_to have_bike
	end
end

