def sum_to(n)
  return n if n == 1
  sum_to(n-1) + n 
end

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_function(n)

end

def ice_cream_shop(flavors, favorite)

end

def reverse(string)

end

