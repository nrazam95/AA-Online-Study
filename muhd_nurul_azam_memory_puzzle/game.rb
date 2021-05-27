require_relative "board"
require_relative "HumanPlayer"
require_relative "computer_player"

class Game
    attr_reader :players


    def initialize(player, size = 4)
        @players = player
        @board = Board.new(size)
        @previous_guess = nil
    end
    
    def run
        until board.won?
            board.render
            pos = play_round
            make_guess(pos)
        end

        puts "You Win!"        
    end
    
    def play_round
        pos = nil

        until pos && valid_pos?(pos)
            pos = players.guess
        end

        pos
    end

    def make_guess(pos)
        revealed_value = board.reveal(pos)
        players.receive_revealed_card(pos, revealed_value)
        board.render

        compare_guess(pos)

        sleep(1)
        board.render
    end

    def match?(pos1, pos2)
        board[pos1] == board[pos2]
    end

    def valid_pos?(pos)
        pos.is_a?(Array) && pos.count == 2 && pos.all? {|x| x.between?(0, board.size - 1)}
    end
    
    def compare_guess(new_guess)
        if previous_guess
            if match?(previous_guess, new_guess)
                players.receive_match(previous_guess, new_guess)
            else
                puts "Try Again."
                [previous_guess, new_guess].each { |pos| board.hide(pos)}
            end
            self.previous_guess = nil
            players.previous_guess = nil
        else
            self.previous_guess = new_guess
            players.previous_guess = new_guess
        end
    end
    

    private

    attr_accessor :previous_guess
    attr_reader :board
end

if $PROGRAM_NAME == __FILE__ 
    size = ARGV.empty? ? 4 : ARGV.shift.to_i
    Game.new(ComputerPlayer.new(size), size).run
end