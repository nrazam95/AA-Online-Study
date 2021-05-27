class ComputerPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(vacant)
        
        picked = vacant.sample
        p "Computer is thinking...."
        picked
    end
    

end