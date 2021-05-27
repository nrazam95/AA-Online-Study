class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end
    
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        true if !self[pos].nil?
        rescue StandardError
           return false
    end

    def empty?(pos)
        if self[pos] == '_'
            true
        else
            false
        end
    end

    def place_mark(pos, mark)
        r = pos[0]
        c = pos[1]
        if valid?(pos) == true && empty?(pos) == true
            self[pos] = mark
        else
            raise "Invalid Mark"
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end
    
    def win_row?(mark)
        return true if @grid.any? {|row| row.uniq.length == 1 && row.uniq.include?(mark)}
        false
    end

    def win_col?(mark)
        return true if @grid.transpose.any? {|col| col.uniq.length == 1 && col.uniq.include?(mark)}
        false
    end

    def win_diagonal?(mark)
        left = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end

        right= (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end

        right || left
    end
    
    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
            return true
        end
        false 
    end
    
    def empty_positions
        return true if @grid.flatten.count("_") > 0
        false
    end
    
    

end