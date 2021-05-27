#Part 2

def proper_factors(num)
    new_array = (1...num).select {|i| num % i == 0}
    new_array
end

def aliquot_sum(num)
    proper_factors(num).inject(0) {|r, ele| r + ele}
end

def perfect_number?(num)
    if num == aliquot_sum(num)
        return true
    else
        return false
    end
end

def ideal_numbers(num)
    n = 6
    new_array = []
    count = 0
    while count < num
        if perfect_number?(n) == true
            new_array << n
            count += 1
        end
        n += 1
    end
    new_array
end
