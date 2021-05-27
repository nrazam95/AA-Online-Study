class HumanPlayer
    attr_reader :mark

    
    def initialize(mark)
        @mark = mark
    end

    def get_position(vacant)
        p "Enter your position"
        response = gets.chomp.split(" ")
        pos = response.map {|num| num.to_i}

        if pos.length == 2 && !vacant.include?(pos)
            pos
        else
            return pos + "is not a legal position"
        end
    end
    

    
end