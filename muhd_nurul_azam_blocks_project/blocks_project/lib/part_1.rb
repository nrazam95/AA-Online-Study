
def select_even_nums(array)
    array.select { |num| num.even?}
end

def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2} 
end

def count_positive_subarrays(array)
    count = 0
    array.count { |arr| count += 1 if arr.sum > 0}
    count
end


def aba_translate(str)
    vowels = "aeiou"
    new_str = str.split("").map do |char|
        if vowels.include?(char)
            char + "b" + char
        else
            char
        end
    end
    new_str.join
end

def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end