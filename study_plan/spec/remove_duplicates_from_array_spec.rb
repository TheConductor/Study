require 'remove_duplicates_from_array'

describe RemoveDuplicatesFromArray do

  it "checks that no elments are removed from a sorted array with no duplicates" do
    test_object = RemoveDuplicatesFromArray.new
    array = test_object.array = [1,2,3]
    array = test_object.remove_duplicates(array)
    check_removal(array)
  end

  it "checks that a single duplicate element can be removed from a sorted array" do
    test_object = RemoveDuplicatesFromArray.new
    array = [1,2,2,3]
    array = test_object.remove_duplicates(array)
    check_removal(array)
  end

  it "checks that a single duplicate element can be removed from an unsorted array" do
    test_object = RemoveDuplicatesFromArray.new
    array = [4,5,0,20,1,2,2,3]
    array = test_object.remove_duplicates(array)
    check_removal(array)
  end

  it "checks that a several duplicate elements can be removed from a large unsorted array" do
    test_object = RemoveDuplicatesFromArray.new
    array = randomize_array(10000, 2)
    array = test_object.remove_duplicates(array)
    check_removal(array)
  end

  def check_removal(array)
    array = array.sort
    last_item = nil
    array.each do |item|
      if item == last_item
        raise("Duplicate Found")
      end
      last_item = item
    end
  end
  
  def randomize_array(size, random_range)
    return_array = Array.new(size)
    for i in 0..size
      random_number = Random.new.rand(random_range)
      return_array[i] = (random_number)
    end
    return_array
  end
end