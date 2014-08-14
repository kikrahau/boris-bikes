require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) {Bike.new}
	let(:broken_bike) { Bike.new.break! }
	let(:holder) {ContainerHolder.new}

	it "A BikeContainer can be initialized with bikes" do 
		mixed_bike_container = ContainerHolder.new ({bikes: [bike, broken_bike]})
		expect(mixed_bike_container.bikes).to eq [bike, broken_bike]
	end

	context "An empty bike container" do
		let(:empty_bike_container) { ContainerHolder.new }
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
		let(:container_with_bike) { ContainerHolder.new({bikes: [bike] }) }

		it 'should be able to release a bike' do
			container_with_bike.release(bike)
			expect(container_with_bike.bike_count).to eq (0)
		end
		it "should raise an error if release called without bike argument" do
			expect { container_with_bike.release() }.to raise_error ArgumentError
		end
	end

	context "A full bike container" do
		let(:full_bike_container) { ContainerHolder.new }
		before { fill_holder(full_bike_container,20,0) }
		
		it 'should know when it is full' do
			expect(full_bike_container).to be_full
		end
		it "should not accept bikes when its full" do 
			expect{ full_bike_container.dock!(bike) }.to raise_error(RuntimeError,"There is no more room for bikes") 
		end
	end

	context "A container containing broken and good bikes" do
		let(:mixed_bike_container) { ContainerHolder.new }
		before { fill_holder(mixed_bike_container,6,7)}

		it "should provide a list with all available bikes" do
			expect(mixed_bike_container.available_bikes.count).to eq 6
		end

		it "should provide a list with all broken bikes" do
			expect(mixed_bike_container.broken_bikes.count).to eq 7
		end
	end
	def fill_holder (holder, good_bikes, broken_bikes)
		good_bikes.times {holder.dock!(Bike.new)}
		broken_bikes.times {holder.dock!(Bike.new.break!)}
	end
end