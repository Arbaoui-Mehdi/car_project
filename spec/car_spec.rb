require 'car'

describe Car do
	
	let(:car) { Car.new }
	
	describe 'attributes' do

		it "allows reading and writing for :make" do
			car.make = 'Test'
			expect(car.make).to eq('Test')
		end

		it "allows reading and writing for :year" do
			car.year = 2017
			expect(car.year).to eq(2017)	
		end

		it "allows reading and writing for :color" do
			car.color = 'foo'
			expect(car.color).to eq('foo')
		end

		it "allows writing for :doors"

	end

	describe '.colors' do
		
		it "returns an array of color names" do
			c = ['blue', 'black', 'red', 'green']
			expect(Car.colors).to match_array(c)
		end

	end

	describe '#full_name' do
		
		context "when initialized with no arguments" do
			it 'returns a string using default values' do
				expect(car.full_name).to eq('2007 Volvo (unknown)')
			end
		end

		it "when initialized with arguments" do
			@honda = Car.new(:make => 'Honda', :year => 2004, :color => 'blue')
			expect(@honda.full_name).to eq("2004 Honda (blue)")
	 end	 
	end

end
