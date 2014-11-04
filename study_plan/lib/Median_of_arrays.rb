class Median_of_arrays
  attr_accessor :array_a
  attr_accessor :array_b
  
  def return_median
    case # all possible cases for how A and B could be related 
    
    when @array_a[@array_a.size-1] < @array_b[0] # all elements of A are less than the elements of B
      return one_array_is_smaller(@array_a,@array_b)
    when @array_b[@array_b.size-1] < @array_a[0] # all elements of B are less than the elements of B
      return one_array_is_smaller(@array_b,@array_a)
    when @array_a[@array_a.size-1] > @array_b[0] &&  @array_a[0] < @array_b[0] # right hand over lap of A and B
      return :test
    when @array_b[@array_b.size-1] > @array_a[0] &&  @array_b[0] < @array_a[0] # left hand over lap of A and B
      return :test
    when @array_a[0] == @array_b[0] && @array_a[@array_a.size-1] == @array_b[@array_b.size-1] # A and B have the same range 
      return :test
    when @array_a[0] > @array_b[0] &&  @array_a[@array_a.size-1] < @array_b[@array_b.size-1] # A contains B
      return :test
    when @array_b[0] > @array_a[0] &&  @array_b[@array_b.size-1] < @array_a[@array_a.size-1] # B contains A 
      return :test
    end
  end

  def one_array_is_smaller(smaller_array, larger_array) 
    # calculate the total number of elements
    total_elements = array_a.size + array_b.size

    # check if the parity of total number of elements
    if total_elements%2 == 0
      # returns the average of the two median elements 
      element_to_be_averaged_1 = 0 
      element_to_be_averaged_2 = 0

      index_1 = total_elements/2
      index_2 = total_elements/2 + 1

      if index_1 < smaller_array.size
        element_to_be_averaged_1 = smaller_array[index_1]
      else
        element_to_be_averaged_1 = larger_array[index_1-smaller_array.size]
      end

      if index_1 < smaller_array.size
        element_to_be_averaged_2 = smaller_array[index_2]
      else
        element_to_be_averaged_2 = larger_array[index_2-smaller_array.size]
      end
      
      return (element_to_be_averaged_1+element_to_be_averaged_2)/2
    else
      # returns the median element
      # since int division will return an int and any odd number
      # dived by 2 will arithmetically result in a decimal number 
      # the operation is resolved by returning the arithmetic value
      # without the decimal therefor it is necessary to add one to the
      # result of the int division in order to arrive at at the median
      median = total_elements/2 + 1
      if median < smaller_array.size
        return smaller_array[median]
      else
        return larger_array[median-smaller_array.size]
      end 
    end 
  end

end