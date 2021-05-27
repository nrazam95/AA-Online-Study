require "./human_player.rb"
require "./board.rb"

class Game

    def initialize(mark1, mark2)
        
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @current_player = @player_1
        @board = Board.new
    end
    
    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end
    
    def play
        while @board.empty_positions
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory to" + @current_player.to_s
                return
            else
                switch_turn
            end
        end
        puts "Draw"

    end
    
   
    
end