# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    
    def span
        if self.length > 1
            largest_range = self.sort.max - self.sort.min
        elsif self.length == 1
            return 0
        else
            return nil
        end
    end

    def average
        if self.length > 0
            avg = (self.sum * 1.00) / self.length
        else
            return nil
        end
    end
    
    def median
        return nil if self.length == 0

        if self.length.odd?
            i = (self.length - 1) / 2
            return self.sort[i]
        elsif self.length.even?
            i1 = (self.length / 2) - 1
            i2 = (self.length / 2)
            avg = (self.sort[i1] + self.sort[i2]) / 2.0
            avg
        end
    end
    
    def counts
        count = {}
        count = Hash.new(0)
        self.map.each { |k, v| count[k] += 1 }
        count
    end
    
    def my_count(str)
        count = 0
        self.map {|char| count += 1 if char == str}
        count
    end

    def my_index(str)
        self.each_with_index do |char, i|
            if char == str
                return i
            end
        end
        nil
    end

    def my_uniq
        new_array = []
        self.counts.each { |k, v| new_array << k}
        new_array
    end

    def my_transpose
        new_array = []

        (0...self.length).each do |hor|
            new_hor = []

            (0...self.length).each do |ver|
                new_hor << self[ver][hor]
            end
            new_array << new_hor
        end
        new_array
    end
    
    
    
end
