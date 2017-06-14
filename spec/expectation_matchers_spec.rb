describe 'Expectation machers' do

  #
  #
  # Equivalence Matchers
  describe 'equivalent matchers' do

		it 'will match loose equality with #eq' do
			a = '2 cats'
			b = '2 cats'
			expect(a).to eq(b)
			expect(a).to be == b     # synonym for #eq

			c = 17
			d = 17.0
			expect(c).to eq(d)       # different types, but 'close' enough
		end

		it 'will match equality with #eql' do
			a = '2 cats'
			b = '2 cats'
			expect(a).to eql(b)      # just a little stricter

			c = 17
			d = 17.0
			expect(c).not_to eql(d)  # not the same, close doesn't count
		end

		it 'will match identity equality with #equal' do
			a = '2 cats'
			b = '2 cats'
			expect(a).not_to equal(b) # same value, but different object

			c = b
			expect(b).to equal(c)     # same object
			expect(b).to be(c)        # synonym for equal
		end

  end

  #
  #
  # Truthiness Matchers
  describe 'thrutiness matchers' do

    it 'will match true/false' do
			expect(1 < 2).to be(true)        # do not use 'be_true'
      expect(1 > 2).to be(false)       # do not use 'be_false'

      expect('foo').not_to be(true)    # the string is not exactly true
      expect(nil).not_to be(false)     # nil is not exactly
      expect(0).not_to be(false)       # 0 is not exactly false
    end

    it 'will match truthy/falsy' do
			expect(1 < 2).to be_truthy
      expect(1 > 1).to be_falsey

      expect('foo').to be_truthy
      expect(nil).to be_falsey
      expect(0).to_not be_falsey
    end

    it 'will match nil' do
      expect(nil).to be_nil
      expect(nil).to be(nil)

      expect(false).not_to be_nil
      expect(0).not_to be_nil
    end

  end

  #
  #
  # Numeric Comparison Machers
  describe 'numeric comparison matchers' do

    it 'will match less than/greater than' do
			expect(10).to be > 9
			expect(10).to be >=10
			expect(10).to be <= 10
			expect(9).to be < 10
    end

    it 'will match numeric ranges' do
      expect(5).to be_between(5, 10).inclusive     # include 5 and 10 from the range
      expect(5).not_to be_between(5, 10).exclusive # exclude 5 and 10 from the range
    	expect(10).to be_within(1).of(11)
      expect(5..10).to cover(9)
    end

  end

	#
	#
	# Collection Matchers
	describe 'collection matchers' do

		it 'will match arrays' do
			array = [1,2,3]

			expect(array).to include(3)
			expect(array).to include(1, 3)            # order is not important

			expect(array).to start_with(1)
			expect(array).to end_with(3)

			expect(array).to match_array([3,2,1])     # order is not important
			expect(array).not_to match_array([1,2])

			expect(array).to contain_exactly(3,2,1)   # similar to match_array
			expect(array).not_to contain_exactly(1,2) # but use individual args
		end

		it 'will match strings' do
			string = 'some string'

			expect(string).to include('ring')
			expect(string).to include('so', 'ring')

			expect(string).to start_with('so')
			expect(string).to end_with('ring')
		end

		it 'will match hashes' do
			hash = { :a => 1, :b => 2, :c => 3 }

			expect(hash).to include(:a)
			expect(hash).to include(:a => 1)

			expect(hash).to include(:a => 1, :c => 3)
			expect(hash).to include({:a => 1, :c => 3})

			expect(hash).not_to include({'a' => 1, 'c' => 3})
		end

  end

  #
  #
  # Other User Matchers
  describe 'other useful matchers' do

    it 'will match only string with a regex' do

			# This matcher is a good way to "spot check" strings
      string = 'The order has been received.'

      expect(string).to match(/order(.+)received/)

      expect('123').to match(/\d{3}/)
      expect(123).not_to match(/\d{3}/)

      email = 'someone@somewhere.com'
      expect(email).to match(/\A\w+@\w+\.\w{3}\Z/)
    end

    it 'will match object types' do
			expect('test').to be_instance_of(String)
			expect('test').to be_an_instance_of(String) # alias of #be_instance_of

      expect('test').to be_kind_of(String)
      expect('test').to be_a_kind_of(String) # alais of #be_kind_of
      expect('test').to be_a(String)
      expect([1,2,3]).to be_an(Array)
    end

    it 'will match objects with #respond_to' do
      string = 'test'
      expect(string).to respond_to(:length)
      expect(string).not_to respond_to(:sort)
    end

    it 'will match class instances with #have_attributes' do
      class Car
				attr_accessor :make, :year, :color
			end
      car = Car.new
      car.make = 'Dodge'
      car.year = 2010
      car.color = 'green'

      expect(car).to have_attributes(:color => 'green')
      expect(car).to have_attributes(
      	:make => 'Dodge',
        :year => 2010,
        :color => 'green'
      )

    end

    it 'will match anything with #satisfy' do
      expect(10).to satisfy do |value|
        (value >= 5) && (value <= 10) && (value % 2 == 0)
      end
    end

  end

end
