require_relative "board"

class Sudoku
    
    def initialize(board)
        @board = board        
    end

    def self.from_file(file)
        board = Board.from_file(file)
        self.new(board)
    end

    def position
        pos = nil

        until pos && valid_pos?(pos)
            puts "Please input your position"
            print ">"
            pos = parse(gets.chomp)
        end
        pos 
    end

    def values
        val = nil

        until val && valid_val?(val)
            puts "Pplease input your value"
            print ">"
            val = parse_I(gets.chomp)
        end
        val
    end
    
    
    def parse(string)
        string.split(",").map {|i| Integer(i)}
    end

    def parse_I(string)
        Integer(string)
    end

    def play
        play_round until over?
        board.render
        puts "You have completed the sudoku. COngrats!"
    end

    def play_round
        board.render
        pos = position
        val = values
        board[pos] = val  
    end
    
    def over?
        board.solved?
    end

    def valid_pos?(pos)
        pos.is_a?(Array) && 
            pos.length == 2 && 
            pos.all? {|i| i.between?(0, board.size - 1)}
    end

    def valid_val?(val)
        val.is_a?(Integer) &&
            val.between?(0, 9)
    end

    private

    attr_reader :board
end

if __FILE__ == $PROGRAM_NAME
    file = 'puzzles/sudoku3.txt'
    board = Board.new(file)
    game = Sudoku.new(board)
    game.play
end