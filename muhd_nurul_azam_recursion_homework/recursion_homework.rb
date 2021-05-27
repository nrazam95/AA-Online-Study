#Exercise 1

def sum_to(n)
    return 0 if n == 0
    return nil if n < 0

    n + sum_to(n - 1)
end

#Exercise 2
def add_numbers(array)
    return array.first if array.length <= 1

    array.pop + add_numbers(array)
end

#Exercise 3
def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1

    (n - 1) * gamma_fnc(n - 1)
end

#Exercise 4
def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors.last == favorite

    ice_cream_shop(flavors[0...-1], favorite)
end


#Exercise 5
def reverse(string)
    return "" if string.empty?

    reverse(string[1..-1]) + string[0]
end
