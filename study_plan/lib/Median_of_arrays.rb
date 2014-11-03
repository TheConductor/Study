class Median_of_arrays
  attr_accessor :array_a
  attr_accessor :array_b
  
  def return_median
    total_elements = array_a.size + array_b.size
    puts "total_elements #{total_elements}"
    median = 0
    if total_elements%2 == 0
      # returns the average of the two median elements 
      median = (total_elements/2 + total_elements/2+1)/2 
    else
      # returns the median element
      # since int division will return an int and any odd number
      # dived by 2 will arithmetically result in a decimal number 
      # the operation is resolved by returning the arithmetic value
      # without the decimal therefor it is necessary to add one to the
      # result of the int division in order to arrive at at the median
      median = total_elements/2 + 1 
    end 
    puts "median #{median}"
    
=begin
    case # all possible cases for how A and B could be related 
    when # all elements of A are less than the elements of B
      # calculate the total number of elements 
      # check if the parity of total number of elements
      # index = divide the total number of elements by 2 and subtract 1 
      # if total number is even 
        # check if index is within A if 
          # set temp_var_1 = A[index]
        # else
          # set temp_var_1 = B[index-A.size-1]
      # repeat for temp_var_2 
      # return the average of the temp_vars

    when # all elements of B are less than the elements of B
      # calculate the total number of elements 
      # check if the parity of total number of elements
      # index = divide the total number of elements by 2 and subtract 1 
      # if total number is even 
        # check if index is within B if 
          # set temp_var_1 = B[index]
        # else
          # set temp_var_1 = A[index-B.size-1]
      # repeat for temp_var_2 
      # return the average of the temp_vars
      
    when # right hand over lap of A and B
    
    when # left hand over lap of A and B
    
    when # A = B
    
    when # A contains B
    
    when # B contains A 
    
    end
=end
  end
  
end