shared_examples_for('a standard vehicle') do

  describe 'attributes' do

    it 'allow reading and writing for :make' do
      subject.make = 'Test'
      expect(subject.make).to eq('Test')
    end

    it 'allow read and writig for :year' do
      subject.year = 2006
      expect(subject.year).to eq(2006)
    end

    it 'allow reading and writing for :color' do
      subject.color = 'red'
      expect(subject.color).to eq('red')
    end

    it 'allow reading for :wheels' do
      expect(subject.wheels).to eq(4)
    end

    it 'allow writing for :doors'

  end

end