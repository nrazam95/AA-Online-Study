# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    num.downto(2) do |numb|
        if num % numb == 0 && prime?(numb)
            return numb
        end
    end
end

def prime?(num)
    if num < 2
        return false
    end

    (2...num).none? { |no| num % no == 0}
end


def unique_chars?(str)
    count = Hash.new(0)
    str.split("").each { |char| count[char] += 1} 
    !count.any? {|k, v| v > 1}        
end



def dupe_indices(array)
    indices = Hash.new {|h, k| h[k] = []}
    array.each.with_index do |char, i| 
        
        indices[char] << i
    end

    indices.select { |key, val| val.length > 1} 
end


def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each { |k, v| hash1[k] += 1}
    arr2.each { |key, val| hash2[key] += 1}

    hash1 == hash2
end