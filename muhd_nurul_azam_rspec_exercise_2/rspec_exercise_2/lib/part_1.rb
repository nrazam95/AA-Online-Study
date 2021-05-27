def partition(arr, num)
    new_array = Array.new(2) {Array.new}
    
    arr.each_with_index do |number|
        if number < num
            new_array[0] << number
        elsif number >= num
            new_array[1] << number
        end
    end
    new_array
end

def merge(hash_1, hash_2)
   new_hash = {}
   hash_1.each { |k, v| new_hash[k] = v }
   hash_2.each { |k, v| new_hash[k] = v }
   new_hash
end

def censor(str, array)
   words = str.split(" ")

   new_words = words.map do |word|
        if array.include?(word.downcase)
            changed(word)
        else
            word
        end
    end
    new_words.join(" ")
end

def changed(string)
    vowels = "aeiou"
    new_string = ""
    string.each_char do |char|
        if vowels.include?(char.downcase)
            new_string += "*"
        else
            new_string += char
        end
    end
    new_string   
end

def power_of_two?(num)
    if num < 2
        return true
    end 

    i = 1
    while i <= num
        if i == num
            return true
        end
        i *= 2
    end

    false
end