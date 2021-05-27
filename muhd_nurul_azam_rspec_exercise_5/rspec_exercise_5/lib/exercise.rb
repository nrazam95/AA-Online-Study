

def zip(*arrays)
    length = arrays.first.length

    (0...length).map do |i|
        arrays.map {|array| array[i]}
    end
end

def prizz_proc(arr, con1, con2)

    arr.select {|n| !con1.call(n) && con2.call(n) || con1.call(n) && !con2.call(n) }
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map {|array| array[i]}
    end
end

def maximum(arr, &prc)
    return nil if arr.empty?

    array = arr.first
    arr.each do |i|
        if prc.call(i) >= prc.call(array)
            array = i
        end
    end
    array
end

def my_group_by(arr, &prc)
    hash = {}
    hash = Hash.new {|hash, key| hash[key] = []}
    
    arr.each do |i|
        hash[prc.call(i)] << i
    end
    hash
end

def max_tie_breaker(arr, lgth, &prc)
    return nil if arr.empty?
    array = arr.first
    arr.each do |i|
        if prc.call(i) > prc.call(array)
            array = i
        elsif prc.call(i) == prc.call(array) && lgth.call(i) > lgth.call(array)
            array = i
        end
    end
    array
end






def silly_syllables(string)

    str = string.split(" ").map {|word| skimming(word)}
    str.join(" ")
end

def skimming(str)
    vowels = "aeiou"
    indices = []
    new_str = ""

    str.each_char.with_index do |char, i|
        if vowels.include?(char)    
            indices << i
        end
    end
    
    if indices.length <= 1
        new_str << str
    elsif indices.length > 1
        new_str << str[indices[0]..indices[-1]]
    end
    new_str
end






