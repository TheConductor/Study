require 'median_of_arrays'

describe MedianOfAarrays do
  context 'Verfies that the correct median is returned' do
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

    shared_examples "randomize array" do |size_a, random_range_a, size_b, random_range_b|
      it 'creates arrays and checks medians' do
        array_a =  Array.new(Random.new.rand(size_a))
        array_b =  Array.new(Random.new.rand(size_b))
        larger_array_size = if size_a > size_b
                              size_a
                            else
                              size_b
                            end
        array_a[0] = Random.new.rand(random_range_a)
        array_b[0] = Random.new.rand(random_range_b)
        for i in 1..larger_array_size
          if i < size_a
            array_a[i] = Random.new.rand(random_range_a) + array_a[i-1]
          end
          if i < size_b
            array_b[i] = Random.new.rand(random_range_b) + array_b[i-1]
          end
        end
        combo_array = array_a + array_b # this array combines array_a and array_b
        combo_array = combo_array.sort
        test_object = MedianOfAarrays.new
        test_median = test_object.return_median(array_a, array_b)
        # if total number of elements is even average the middle two elements
        # otherwise total number of elements is odd return the middle one.
        if array_a.size%2==0
          value_1 = combo_array[(combo_array.size)/2 - 1]
          value_2 = combo_array[(combo_array.size)/2]
          expect(test_median).to eq (value_1+value_2)/2
        else
          expect(test_median).to eq combo_array[(combo_array.size)/2]
        end
      end
    end

    describe 'when A > B even # of elements' do
      it_should_behave_like "check median", [0,1,2], [300,400,500]
    end

    describe 'when A > B odd # of elements' do
      it_should_behave_like "check median", [0,1,2,4], [200,300,400,500,600]
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

    describe 'for 2 small random arrays' do
      it_should_behave_like "randomize array",10, 100, 10, 100
    end

    describe 'for 2 large random arrays' do
      it_should_behave_like "randomize array",1000, 10000, 10000, 10000
    end

    describe 'for 2 completely random arrays' do
      it_should_behave_like "randomize array",Random.new.rand(10000), Random.new.rand(10000), Random.new.rand(10000), Random.new.rand(10000)
    end
  end
end
