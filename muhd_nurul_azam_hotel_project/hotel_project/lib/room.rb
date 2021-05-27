class Room

    def initialize(num)
        @capacity = num
        @occupants = []
    end
    
    def capacity
        @capacity        
    end
    
    def occupants
        @occupants
    end
    
    def full?
        while @occupants.length < @capacity
            return false
        end
        return true
    end

    def available_space
        space = @capacity - @occupants.length 
        space        
    end
    
    def add_occupant(str)
        if !self.full?
            @occupants << str
            return true
        else
            return false
        end
    end
    
    


end
