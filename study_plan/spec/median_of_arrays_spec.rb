require 'Median_of_arrays'

describe Median_of_arrays do
  
  it "checks that when A is smaller than B the correct median is returned" do
    check_median([0,1,2],[3,4,5])
  end

  it "checks that when B is smaller than A the correct median is returned" do
    check_median([3,4,5],[0,1,2])
  end

  it "checks that when there is right hand over lap of A and B the correct median is returned" do
    check_median([0,1,2],[1,2,3])
  end

  it "checks that when there is left hand over lap of A and B the correct median is returned" do
    check_median([1,2,3],[0,1,2])
  end

  it "checks that when A = B the correct median is returned" do
    check_median([0,1,2],[0,1,2])
  end

  it "checks that when A contains B the correct median is returned" do
    check_median([0,1,2,3,5],[1,2,3])
  end

  it "checks that when B contains A the correct median is returned" do
    check_median([1,2,3],[0,1,2,3,5])
  end

  it "checks that the correct median is returned for 2 small random arrays" do
    check_median(randomize_array(10,100),randomize_array(10,100))
  end

  it "checks that the correct median is returned for 2 large random arrays" do
    check_median(randomize_array(10000,10000),randomize_array(10000,10000))
  end

  it "checks that the correct median is returned for 2 completely random arrays" do
    check_median(randomize_array(Random.new.rand(10000),Random.new.rand(10000)),randomize_array(Random.new.rand(10000),Random.new.rand(10000)))
  end

  def check_median(array_a, array_b)
    test_object = Median_of_arrays.new
    test_object.array_a = array_a
    test_object.array_b = array_b
    index_for_a = 0
    index_for_b = 0
    
    combo_array = [] # this array combines array_a and array_b

    for i in 0..(array_a.size+array_b.size)
      if index_for_a < array_a.size && index_for_b < array_b.size
        if(array_a[index_for_a]<index_for_b[index_for_b])
          combo_array.push(array_a[index_for_a])
        else
          combo_array.push(array_b[index_for_b])
        end
      elsif index_for_a > array_a.size
        for j in index_for_b..array_b.size
          combo_array.push(array_b[index_for_b])
        end
      elsif index_for_b > array_b.size
        for j in index_for_a..array_a.size
          combo_array.push(array_a[index_for_a])
        end
      end
    end

    # if total number of elements is even average the middle two elements 
    # otherwise total number of elements is odd return the middle one.
    if combo_array.size%2==0
      expect(test_object.return_median).to eq (combo_array[(combo_array.size)/2]+combo_array[(combo_array.size)/2+1])/2
    else
      expect(test_object.return_median).to eq combo_array[(combo_array.size+1)/2]
    end 
  end 
  
  def randomize_array(size, random_range)
    return_array = [Random.new.rand(random_range)]
    for i in 1..size
      random_number = Random.new.rand(random_range) + return_array[i-1]
      return_array.push(random_number)
    end
    return_array
  end
end