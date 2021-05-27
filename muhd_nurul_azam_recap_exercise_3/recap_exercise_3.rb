#General Problems!

def no_dupes?(array)
    hash = {}
    new_array = []
    hash = Hash.new {|hash, key| hash[key] = 0}

    array.each do |num|
        hash[num] += 1
    end
    
    hash.each do |k, v| 
        new_array << k if v == hash.values.min
    end

    if new_array.include?(true) || new_array.include?(false)
       []
    else
        new_array
    end
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])
p no_dupes?([false, true, false, nil])







def no_consecutive_repeats?(array)
    (0...array.length).each do |i|
        if array[i] == array[i+1]
            return false
        end
    end
    true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true







def char_indices(str)
    new_str = str.split("")
    hash = {}
    hash = Hash.new {|hash, key| hash[key] = []}

    new_str.each_with_index do |char, i|
        hash[char] << i
    end
    hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}






def longest_streak(str)
    current = ""
    longest = ""

    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            current += str[i]
        else
            current = str[i]
        end

        if current.length >= longest.length
            longest = current
        end
    end
    longest
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'






def bi_prime?(num)
    new_array = []
    (2...num).each { |i| new_array << i if num % i == 0 && prime?(i)}
    new_array.any? do |n|
        m = num / n
        new_array.include?(m)
    end
end

def prime?(n)
    if n < 2
        return false
    end

    (2...n).none? {|i| n % i == 0}
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false






def vigenere_cipher(str, array)

    new_array = []
    alphabet = ("a".."z").to_a

    str.each_char.with_index do |char, i|
        old_pos = alphabet.index(char)
        new_pos = alphabet.index(char) + array[i % array.length]
        new_array << alphabet[new_pos % alphabet.length]
    end
    new_array.join("")
    
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])  






def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = "aeiou"
    indices = (0...str.length).select { |i| vowels.include?(str[i])}
    
    new_indices = indices.rotate(-1)

    indices.each_with_index do |idx, i|
        new_vowel = str[new_indices[i]]
        new_str[idx] = new_vowel
    end

    new_str

    
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome') 






#Proc Problems

class String
    def select(&prc)
        return "" if prc.nil?
        new_str = ""

        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[i] = prc.call(char, i)
        end
    end
    
    
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""






#Recursion Problems

def multiply(t, b)
    return 0 if t == 0

    if b.negative?() && t.negative?()
        -b + multiply(t + 1, b)
    elsif t.negative?()
        -b + multiply(t + 1, b) 
    else
        b + multiply(t - 1, b)
    end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18






def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    new_array = lucas_sequence(num - 1)
    new_arr = new_array[-1] + new_array[-2]
    new_array << new_arr
    new_array
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]






def prime_factorization(num)

    (2...num).each do |i|
        if num % i == 0
            i2 = num / i
            return [*prime_factorization(i), *prime_factorization(i2)]
        end 
    end
    [num]
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]