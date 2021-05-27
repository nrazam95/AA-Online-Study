require "passenger"

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end
    
    def full?
        if self.passengers.length == @capacity
            return true
        else
            return false
        end
    end
    
    def board_passenger(str)        
        if !self.full? && str.has_flight?(@flight_number)
            @passengers << str
        end
    end
    
    def list_passengers
        @passengers.map(&:name)
    end

    def [](num)
        @passengers[num]
    end

    def << str
        self.board_passenger(str)
    end
    
end