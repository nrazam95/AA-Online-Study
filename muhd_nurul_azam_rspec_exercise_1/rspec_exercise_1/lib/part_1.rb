def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array) 
    array.sum / (array.length * 1.0)
end

def repeat(str, num)
    new_string = ""
    num.times do
        new_string += str
    end
    new_string
end

def yell(str)
   str.upcase! + "!"
end

def alternating_case(str)
    
    new_string = str.split(" ").map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    new_string.join(" ")
end