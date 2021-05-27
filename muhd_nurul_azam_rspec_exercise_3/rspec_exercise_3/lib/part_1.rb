#Part 1

def is_prime?(num)
    return false if num <= 1

    (2...num).none? {|i| num % i == 0}

end

def nth_prime(num)
    n = 1
    count = 0
    while count < num
        if is_prime?(num)
            count += 1
        end
        n += 1
    end
    n   
end


def prime_range(min, max)
    new_array = []
    (min..max).each do |i| 
        if is_prime?(i) == true
            new_array << i
        end
    end
    new_array
end
