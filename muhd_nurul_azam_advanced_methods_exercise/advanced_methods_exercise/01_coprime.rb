# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    if array(num_1, num_2).length == 1
        return true
        
    else
        return false
    end
end

def dividers(num)
    nums = []
    (1..num).each_with_index do |n, i|
        if num % n == 0
            nums << n 
        end
    end
    return nums
end

def array(num_1, num_2)
    numb = []
    dividers(num_1).each_with_index do |number, i|
        if dividers(num_2).include?(number)
            numb << number 
        end
               
    end
    return numb
end
p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false