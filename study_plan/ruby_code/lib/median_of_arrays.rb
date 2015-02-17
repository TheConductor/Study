# Finds the median of two sorted arrays
class MedianOfAarrays
  def return_median(array_a, array_b)
    sorted_array = merge(array_a, array_b)
    size         = sorted_array.size
    # check parity of array size in order to return the popper median,
    # if the parity is even reuturn the mean of the middle two elemnts
    # if odd return the middle element.
    if size.even?
      return (sorted_array[size / 2] + sorted_array[(size / 2) - 1]) / 2
    else
      return sorted_array[size / 2]
    end
  end

  def merge(array_a, array_b)
    return_array = Array.new(array_a.size + array_b.size)
    for i in 0..return_array.size-1
      return_array[i] =
        if array_a.size != 0 && array_b.size != 0
          if array_a[0] < array_b[0]
            array_a.shift
          else
            array_b.shift
          end
        elsif array_a.size == 0
          array_b.shift
        elsif array_b.size == 0
          array_a.shift
        end
    end
    return_array
  end
end
