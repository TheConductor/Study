require 'median_of_arrays'

describe MedianOfAarrays do

  shared_examples "check median" do |array_a, array_b|
    let(:test_object) {MedianOfAarrays.new}
    let(:test_median) {test_object.return_median(array_a, array_b)}

    it 'compares the medians' do
      combo_array = array_a + array_b # this array combines array_a and array_b
      combo_array = combo_array.sort

      # if total number of elements is even average the middle two elements
      # otherwise total number of elements is odd return the middle one.
      if combo_array.size%2==0
        expect(test_median).to eq (combo_array[(combo_array.size)/2 - 1] + combo_array[(combo_array.size)/2])/2
      else
        expect(test_median).to eq combo_array[(combo_array.size)/2]
      end
    end
  end

  shared_examples "randomize array" do |size, random_range|
    let(:return_arra) {[Random.new.rand(random_range)]}

    it 'creates the radom array' do
      for i in 1..size
        random_number = Random.new.rand(random_range) + return_array[i-1]
        return_array.push(random_number)
      end
      return_array
    end
  end

  context 'Verfies that the correct median is returned' do
    describe 'when A > B even # of elements' do
      it_should_behave_like "check median", [0,1,2], [300,400,500]
    end

    describe 'when A > B odd # of elements' do
     it_should_behave_like "check median", [0,1,2], [300,400,500,600]
    end

    describe 'when B > A even # of elements' do
      it_should_behave_like "check median", [300,400,500],[0,1,2]
    end

    describe 'when B > A even  # of elements' do
      it_should_behave_like "check median", [300,400,500,600],[0,1,2]
    end

    describe 'when right hand overlap' do
      it_should_behave_like "check median", [0,1,2],[1,2,3]
    end

    describe 'when left hand overlap' do
      it_should_behave_like "check median", [1,2,3],[0,1,2]
    end

    describe 'when A = B' do
      it_should_behave_like "check median", [0,1,2],[0,1,2]
    end

    describe 'when A contains B' do
      it_should_behave_like "check median", [0,1,2,3,5],[1,2,3]
    end

    describe 'when B contains A' do
      it_should_behave_like "check median", [1,2,3],[0,1,2,3,5]
    end

=begin
    it 'for 2 small random arrays' do
      check_median(randomize_array(10,100),randomize_array(10,100))
    end

    it 'for 2 large random arrays' do
      check_median(randomize_array(10000,10000),randomize_array(10000,10000))
    end

    it 'for 2 completely random arrays' do
      check_median(randomize_array(Random.new.rand(10000),Random.new.rand(10000)),randomize_array(Random.new.rand(10000),Random.new.rand(10000)))
    end
=end
  end
end
