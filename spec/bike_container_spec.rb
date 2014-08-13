require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	it "should accept a bike" do
		expect(holder.bike_count).to eq (0)
		holder.dock!(bike)
		expect(holder.bike_count).to eq (1)
	end

	it 'should be able to release a bike' do
		holder.dock!(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq (0)
	end

	it "should only release existing bikes" do 
		bike1 = Bike.new
		expect(lambda{holder.release(bike1)} ).to raise_error "Bike is not there"
	end
	it "should ask for specification, if not clear which bike is to be released" do
		expect(lambda{holder.release()}).to raise_error ArgumentError
	end
	it 'should know when it is full' do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end
	# it 'should know when it is empty' do
	# 	holder.dock!(bike)
	# 	expect(holder).not_to be_empty
	# 	empty_holder holder
	# 	expect(holder).to be_empty
	# end

	it "should not accept bikes if it'full" do
		fill_holder holder
		expect(lambda {holder.dock!(bike) } ).to raise_error(RuntimeError)
	end 

	it "should provide a list with all available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock!(working_bike)
		holder.dock!(broken_bike)
		expect(holder.available_bikes).to eq [working_bike]
	end
	it "should provide a list with all broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock!(working_bike)
		holder.dock!(broken_bike)
		expect(holder.broken_bikes).to eq [broken_bike]
	end

	# def empty_holder (holder)
	# 	until empty?
	# 		holder.pop
	# 	end
	# end
	def fill_holder (holder)
		20.times {holder.dock!(Bike.new)}
	end
end