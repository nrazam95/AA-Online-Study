class Stack

    def initialize
        @underlying_array = []
    end
    
    def push(el)
        underlying_array.push(el)
        el
    end
    
    def pop
        underlying_array.pop
    end

    def peek
        underlying_array.last
    end
 
    private

    attr_reader :underlying_array
    
end



class Queue
    
    def intialize
        @underlying_array = []
    end
    
    def enqueue(el)
        underlying_array.push(el)
    end
    
    def dequeue
        underlying_array.shift
    end
    
    def peek
        underlying_array.first
    end
    
    private

    attr_reader :underlying_array
end

class Map

    def initialize
        @underlyring_array = []
    end
    
    def set(key, value)
        pair_index = underlyring_array.index { |pair| pair[0] == key}
        if pair_index
            underlyring_array[pair_index][1] = value
        else
            underlyring_array.push([key, value])
        end
        value
    end

    def get(key)
        underlying_array.each { |pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        value = get(key)
        underlyring_array.reject! { |pair| pair[0] == key}
        value
    end

    def show
        deep_dup(underlyring_array)
    end
    
    private
    
    attr_reader :underlying_array

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el}
    end
    

end
