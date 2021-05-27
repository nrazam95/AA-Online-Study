def hipsterfy(str)
    vowels = "aeiou"
    i = str.length - 1
    while i >= 0
        if vowels.include?(str[i])
           return str[0...i] + str[i+1..-1]
        end
        i -= 1
    end
    str
end

def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)

    str.downcase.each_char do |char|
        if vowels.include?(char)
            count[char] += 1
        end
    end
    count
end


def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""

    str.each_char.with_index do |char, i|
        if alphabet.include?(char)
            mode = alphabet.index(char) + num
            new_str += alphabet[mode % 26]
        else
            new_str += char
        end
    end
    new_str
end