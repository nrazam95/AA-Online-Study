#Part 2

def element_count(array)
    hash = {}
    hash = Hash.new {|hash, key| hash[key] = 0}
    array.each {|ele| hash[ele] += 1}
    hash
end


def char_replace!(str, hash)


    str.split("").map.with_index do |char, i|
            if hash.has_key?(char)
                str[i] = hash[char]
            else
                char
            end
    end

    str
end

def product_inject(array)
    array.inject(1) {|result, ele| result * ele}
end

