class MedianOfAarrays
  attr_accessor :array_a
  attr_accessor :array_b
  
  def return_median
      combine_and_sort(@array_a, @array_b)
  end


  def combine_and_sort(array_1, array_2)
    array_1 = array_1 + array_2 # combines the 2 array by appending 2 to the end of 1
    array_1 = merge_sort(array_1)
    # check parity of array size 
    if array_1.size%2==0
      avg = (array_1[(array_1.size)/2] + array_1[(array_1.size)/2-1]) / 2 # averages the middle elements 
      return avg
    else
      return array_1[array_1.size/2]
    end
  end

=begin
  This is a merge sort implementation I found online
  https://gist.github.com/aspyct/3433278
=end

  def merge_sort(array)
    if array.count <= 1
      # Array of length 1 or less is always sorted
      return array
    end
 
    # Apply "Divide & Conquer" strategy
 
    # 1. Divide
    mid = array.count / 2
    part_a = merge_sort array.slice(0, mid)
    part_b = merge_sort array.slice(mid, array.count - mid)
 
    # 2. Conquer
    array = []
    offset_a = 0
    offset_b = 0
    while offset_a < part_a.count && offset_b < part_b.count
      a = part_a[offset_a]
      b = part_b[offset_b]
 
      # Take the smallest of the two, and push it on our array
      if a <= b
        array << a
        offset_a += 1
      else
        array << b
        offset_b += 1
      end
    end
 
    # There is at least one element left in either part_a or part_b (not both)
    while offset_a < part_a.count
      array << part_a[offset_a]
      offset_a += 1
    end
 
    while offset_b < part_b.count
      array << part_b[offset_b]
      offset_b += 1
    end

    return array
  end
end