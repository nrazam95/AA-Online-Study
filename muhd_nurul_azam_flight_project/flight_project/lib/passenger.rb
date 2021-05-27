class Passenger
    
    attr_reader :name

    def initialize(name)
        
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        if @flight_numbers.any? {|f| str.upcase == f}
            true
        else @flight_numbers.none? {|f| str == f}
            false
        end
    end

    def add_flight(str)
        if has_flight?(str) == false
            @flight_numbers << str.upcase
        end
    end
end