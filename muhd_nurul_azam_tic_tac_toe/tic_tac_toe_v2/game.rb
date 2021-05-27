require "./human_player.rb"
require "./board.rb"

class Game

    def initialize(n, *mark)
        length = mark.length
        @players = []

        (0...length).each do |i|
            @players << HumanPlayer.new(mark[i])
        end
        
        @current_player = @players[0]
        @board = Board.new(n)
    end
    
    def switch_turn
        if @current_player == @players[0]
            @current_player = @players.rotate![0]
        end
    end
    
    def play
        while @board.empty_positions
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory to You!"
                return
            else
                switch_turn
            end
        end
        puts "Draw"

    end
    
   
    
end