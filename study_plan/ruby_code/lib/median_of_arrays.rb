# Finds the median of two sorted arrays
class MedianOfAarrays
  def return_median(array_a, array_b)
    array_a      += array_b #  combines and sorts the arrays
    sorted_array = merge_sort(array_a)
    size         = sorted_array.size # saves 4 method calls in conditonal

    # check parity of array size in order to return the popper median,
    # if the parity is even reuturn the mean of the middle two elemnts
    # if odd return the middle element.
    if size.even?
      return (sorted_array[size / 2] + sorted_array[(size / 2) - 1]) / 2
    else
      return sorted_array[size / 2]
    end
  end

  def merge_sort(array)
    # divide into n sublists
    if array.size > 1
      array = [
        array.slice(0,array.size/2),
        array.slice((array.size/2),array.size)
      ]
      array.each do |item|
        merge_sort(item)
      end
    else
      array.sort
    end
  end
end
