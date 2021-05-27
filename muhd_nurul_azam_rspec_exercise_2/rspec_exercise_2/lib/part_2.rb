def palindrome?(str)
   str.each_char.with_index do |char, i|
        if str[i] != str[-i - 1]
            return false
        end
    end
   true
end



def substrings(str)
    new_string = []
    (0...str.length).each do |i|
        (i...str.length).each do |idx|
           new_string << str[i..idx]
        end
    end
   new_string 
end

def palindrome_substrings(string)
    substrings(string).select { |ele| palindrome?(ele) && ele.length >= 2}
end