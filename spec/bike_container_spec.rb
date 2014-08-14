require 'bike_container'

shared_examples "bike container" do

	let(:bike) {Bike.new}
	let(:broken_bike) { Bike.new.break! }
	let(:empty_bike_container) {described_class.new}
	let(:congested_bike_container) { described_class.new(bikes: make_bike_array(empty_bike_container.capacity, empty_bike_container.capacity)) }
	let(:container_with_bike) { described_class.new({bikes: [bike] }) }

	it "A BikeContainer can be initialized with a bike" do 
		expect(container_with_bike.bikes).to eq [bike]
	end

	it "should raise an error if initialized with too many bikes" do
		expect { congested_bike_container }.to raise_error RuntimeError
	end

	context "An empty bike container" do
		it "should accept a bike" do
			empty_bike_container.dock!(bike)
			expect(empty_bike_container.bike_count).to eq (1) 
		end
		it "should not be able to release a bike" do 
			expect{ empty_bike_container.release(bike) }.to raise_error "Bike is not there"
		end

		it "should know when it is empty" do
			expect(empty_bike_container).to be_empty 
		end
	end	

	context "A bike container filled with one bike" do
		

		it 'should be able to release a bike' do
			container_with_bike.release(bike)
			expect(container_with_bike.bike_count).to eq (0)
		end
		it "should raise an error if release called without bike argument" do
			expect { container_with_bike.release() }.to raise_error ArgumentError
		end
	end

	context "A full bike container" do
		let(:full_bike_container) { described_class.new(bikes: make_bike_array(empty_bike_container.capacity,0)) }
		
		it 'should know when it is full' do
			expect(full_bike_container).to be_full
		end
		it "should not accept bikes when its full" do 
			expect{ full_bike_container.dock!(bike) }.to raise_error(RuntimeError,"There is no more room for bikes") 
		end
	end

	context "A container containing broken and good bikes" do
		let(:mixed_bike_container) { described_class.new(bikes: make_bike_array(6,7)) }

		it "should provide a list with all available bikes" do
			expect(mixed_bike_container.available_bikes.count).to eq 6 if mixed_bike_container.class != Person
		end

		it "should provide a list with all broken bikes" do
			expect(mixed_bike_container.broken_bikes.count).to eq 7
		end
	end
	def make_bike_array (good_bikes, broken_bikes)
		bikes = []
		good_bikes.times { bikes << Bike.new }
		broken_bikes.times { bikes << Bike.new.break! }
		bikes
	end
end