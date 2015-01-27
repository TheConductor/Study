require 'remove_duplicates_from_array'

describe RemoveDuplicatesFromArray do
  context "Verifies an array has no duplicates" do
    shared_examples "check removal" do |array|
      it "checks for duplicates" do
        array = array.sort
        last_item = nil
        array.each do |item|
          if item == last_item
            raise("Duplicate Found")
          end
          last_item = item
        end
      end
    end

    shared_examples "randomize array" do |size, random_range|
      it "creates a random array and checks for duplicates" do
        array = Array.new(size)
        for i in 0..size
          random_number = Random.new.rand(random_range)
          array[i] = (random_number)
        end
        array = array.sort
        test_object = RemoveDuplicatesFromArray.new
        array = test_object.remove_duplicates(array)
        last_item = nil
        array.each do |item|
          if item == last_item
            raise("Duplicate Found")
          end
          last_item = item
        end
      end
    end

    describe "sorted array with no duplicates" do
      test_object = RemoveDuplicatesFromArray.new
      array = test_object.array = [1,2,3]
      array = test_object.remove_duplicates(array)
      it_should_behave_like "check removal", array
    end

    describe "sorted array with single duplicate" do
      test_object = RemoveDuplicatesFromArray.new
      array = [1,2,2,3]
      array = test_object.remove_duplicates(array)
      it_should_behave_like "check removal", array
    end

    describe "unsorted array with single duplicate" do
      test_object = RemoveDuplicatesFromArray.new
      array = [4,5,0,20,1,2,2,3]
      array = test_object.remove_duplicates(array)
      it_should_behave_like "check removal", array
    end

    describe "large unsorted array with several duplicates" do
      it_should_behave_like "randomize array", 10000, 2
    end
  end
end
