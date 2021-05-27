# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    new_array = [num_1, num_2]
    max_num = new_array.max

    (1...max_num).each do |i|
        (1...max_num).each do |i2|
            if num_1 * i == num_2 * i2
                return num_1 * i
            end
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    new_array =[]
    new_arr = []
    hash = {}
    hash = Hash.new {|k, v| hash[k] = 0}
    new_str = str.split("")
    (0...new_str.length).each do |i0|
        (i0...new_str.length).each do |iz|
            pair = new_str[i0..iz]
            new_array << pair
        end
    end

    new_array.each do |combined|
        if combined.length == 2
            new_arr << combined 
        end
    end
    
    new_arr.each do |pairs| 
        hash[pairs] += 1
    end
    
    hash.each {|k, v| return k.join("") if v == hash.values.max}

    
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v| 
            new_hash[v] = k
        end

        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0...self.length).each do |i|
            self.each_with_index do |n, idx|
                if i > idx && self.include?(self[idx]) && self[idx] + self[i] == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b}
        
        sorted = false
        while !sorted
            sorted = true
        

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i + 1] = self[i + 1], self[i]
                end
            end
        end

        self
    end
end
