

def quick_sort(array)
    return array if array.length <= 1
    pivot = array.delete_at(rand(array.length))
  
    left = Array.new
    right = Array.new
  
    array.each do |x|
      if x <= pivot
        left << x
      else
        right << x
      end
    end
  
    return *quick_sort(left), pivot ,*quick_sort(right)
  
  end

var= [9,3,7,4,5,1,10] 
puts(var)
puts(quick_sort(var))