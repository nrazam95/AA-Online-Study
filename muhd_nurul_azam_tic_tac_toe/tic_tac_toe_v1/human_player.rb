class HumanPlayer
    attr_reader :mark

    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Enter your position"
        response = gets.chomp.split(" ")
        pos = response.map {|num| num.to_i}

        if pos.length == 2
            pos
        else
            raise "Only 2 number accepted"
        end
    end
    

    
end