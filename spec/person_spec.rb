require 'person'
require 'docking_station'
describe Person do

	let(:bike) { Bike.new }
	let(:person) { Person.new}
	let(:person_with_bike) { Person.new.receive!(bike) }
	let (:docking_station) { DockingStation.new(bikes: [bike]) }

	it "should not have a bike at the beginning" do
		expect(person).not_to have_bike
	end
	

	context "A person without a bike" do 
		it "should be able to receive a bike" do 
			person.receive!(bike)
			expect(person).to have_bike
		end
		it "should not be able to release a bike if it doesnt have one" do 
			expect { person.release!(bike)}.to raise_error RuntimeError
		end
		it "should be able to collect a bike from a station" do 
			person.collect_bike_from(docking_station,bike)
			# ben thinks the should be in two test maybe
			expect(person.bike).to eq bike
			expect(docking_station.bikes.include?(bike)).to be false
		end
	end

	context "A person with a bike" do 

		it "should be able to release a bike" do	
			person_with_bike.release!(bike)
			expect(person).not_to have_bike
		end
		it "should be able to break a bike" do 
			person_with_bike.break_bike(bike)
			expect(bike).to be_broken
		end

		it "should not be able to receive a bike" do
			expect { person_with_bike.receive!(bike) }.to raise_error RuntimeError
		end

		it "should be able to return a bike to a station" do 
			person_with_bike.return_bike_to(docking_station,bike)
			# ben thinks the should be in two test maybe
			expect(person_with_bike.bike).not_to eq bike
			expect(docking_station.bikes.include?(bike)).to be true
		end
	end
end

