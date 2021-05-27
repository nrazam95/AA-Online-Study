def my_map(array, &prc)
    new_array = []
    array.each { |arr| new_array << prc.call(arr)}
    new_array
end

def my_select(array, &prc)
    new_array = []
    array.each { |arr| new_array << arr if prc.call(arr)}
    new_array
end

def my_count(array, &prc)
    count = 0
    array.each { |arr| count += 1 if prc.call(arr)}
    count 
end

def my_any?(array, &prc)
    !array.none? { |arr| prc.call(arr)}
end

def my_all?(array, &prc)
    !array.any? { |arr| !prc.call(arr)}
end

def my_none?(array, &prc)
    array.all? { |arr| !prc.call(arr)}
end





