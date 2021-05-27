def factors(num)
    new_set = []
    (1..num).each do |i|
        if num % i == 0
            new_set << i
        end
    end
    new_set
end

def subwords(str, arrays)
    kamus = []

    arrays.each do |word|
        if str.include?(word)
            kamus << word
        end
    end

    kamus

end

def doubler(array)
    new_array = []
    (0..array.length - 1).each do |i|
        new_array << array[i] * 2
    end
    new_array
end

class Array
    

    def bubble_sort!(&prc)
        return self if self.empty?
        return self if self.length == 1
        prc ||= Proc.new {|a, b| a <=> b}

        sorted = false

        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort
        self.dup.bubble_sort!
    end

    def my_each(&prc)
        self.length.times do |i|
            if prc.call(self[i]) == self
                return self
            end
        end
        self
    end

    def my_map(&prc)
        new_set = []
        self.my_each do |ele|
            new_set << prc.call(ele)
        end
        new_set
    end

    def my_select(&prc)
        new_set = []
        self.my_each {|ele| new_set << ele if prc.call(ele)}
        new_set
    end

    def my_inject(accummulator = nil, &prc)
        prc ||= Proc.new {|a, b| a <=> b}

        i = 0 
        if accummulator.nil?
            accummulator = self.first
            i = 1
        end

        self[i..-1].my_each do |ele|
            accummulator = prc.call(accummulator, ele)
        end
        accummulator
    end   
end


def concatenate(strings)
    new_str = strings.inject(:+)
    new_str
end