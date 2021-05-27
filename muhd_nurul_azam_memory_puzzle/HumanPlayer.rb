class HumanPlayer
    attr_accessor :previous_guess

    
    def initialize(_size)
      @previous_guess = nil
    end

    def guess
      prompt
      separated(STDIN.gets.chomp)
    end
    
    def prompt
      puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
      print "> "
    end
    
    def separated(string)
      string.split(",").map { |x| Integer(x) }
    end
    
    def receive_revealed_card(pos, value)
        
    end
    
    def receive_match(_pos1, _pos2)
      puts "It's a match!"
    end
    
end