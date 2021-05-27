class Array

    def my_each(&prc)
        self.select {|i| prc.call(i)}

        self
    end
    
    def my_select(&prc)
        select = []
        self.my_each do |i|
            select << i if prc.call(i)
        end
        select
    end
    
    def my_reject(&prc)
        reject = []
        self.my_select do |i|
            reject << i if !prc.call(i)
        end
        reject
    end
    
    def my_any?(&prc)
        any = []
        self.my_each {|i| any << i if prc.call(i)}

        if !any.empty?
            true
        else
            false
        end
    end
    
    def my_all?(&prc)
        all = []
        self.my_each {|i| all << i if prc.call(i)}

        if all == self
            return true
        else
            false
        end
    end

    def my_flatten
        flatten = []

        self.my_each do |i|
            if i.is_a?(Array)
                flatten.concat(i.my_flatten)
            else
                flatten << i
            end
        end
        flatten
    end
    
    def my_zip(*arrays)
        length = self.length
        new_set = []

        length.times do |i|
            zip = [self[i]]

            arrays.my_each do |array|
                zip << array[i]
            end

            new_set << zip
        end

        new_set
        
    end

    def my_rotate(n = 1)
        i = n % self.length

        self.drop(i) + self.take(i)

    end

    def my_join(str = "")
        new_set = ""
        self.length.times do |i|
            new_set += self[i]
            new_set += str unless i == self.length - 1
        end
        new_set
    end
    
    def my_reverse
        reversed = []
        self.my_each do |ele|
            reversed.unshift(el)
        end
        reversed
    end
    
    
    
end