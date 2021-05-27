#Part 1

def my_reject(array, &prc)
    array.select {|n| !prc.call(n)}
end

def my_one?(array, &prc)
    new_array = array.select {|n| prc.call(n)}
    if new_array.length == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &prc)
    new_hash = Hash.new
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(array, even, positive)
    even = Proc.new { |n| n.even? }
    positive = Proc.new { |n| n > 0 }

    array.select {|i| !even.call(i) && positive.call(i) || even.call(i) && !positive.call(i) }
end

def proc_count(num, array)
    even = Proc.new { |n| n.even? }
    div_by_5 = Proc.new { |n| n % 5 == 0 }
    positive = Proc.new { |n| n % 5 == 0 }
    upcase = Proc.new { |s| s == s.upcase }
    ends_exclamation = Proc.new { |s| s[-1] == "!" }
    
    count = 0
    array.each do |prc|
        count += 1 if prc.call(num)
    end
    count
end

