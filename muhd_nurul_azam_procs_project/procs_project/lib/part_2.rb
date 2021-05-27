def reverser(array, &prc)
    prc.call(array.reverse)
end

def word_changer(arr, &prc)
    new_array = arr.split(" ").map { |word| prc.call(word)}
    new_array.join(" ")
end

def greater_proc_value(val, proc_1, proc_2)
    if proc_1.call(val) > proc_2.call(val)
        proc_1.call(val)
    else
        proc_2.call(val)
    end
end

def and_selector(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |val|
        if proc_1.call(val) && proc_2.call(val)
            new_arr << val
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_array = []
    arr.each_with_index do |num, i|
        if i % 2 == 0 
            new_array << prc1.call(num)
        else 
            new_array << prc2.call(num)
        end
    end
    new_array
end


