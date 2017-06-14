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

end
