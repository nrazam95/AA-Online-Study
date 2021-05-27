require_relative "card"

class Board
    
    attr_reader :size

    def initialize(size = 4)
        @grid = Array.new(size) { Array.new(size) }
        @size = size
        populate
    end

    def populate
        needed = (size**2) / 2
        card = Card.shuffled_array(needed)
        grid.each_index do |i|
            grid[i].each_index do |idx|
                pos = i, idx
                self[pos] = card.pop
            end
        end
    end

    def render
        system("clear")
        puts " #{(0...size).to_a.join(' ')}"
        grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end
    
    def won?
        grid.all? do |row|
            row.all?(&:revealed?)
        end       
    end
    
    def [](pos)
        row, col = pos
        grid[row][col]        
    end

    def []=(pos, value)
        row, col = pos
        grid[row][col] = value
    end

    def hide(pos)
        self[pos].hide
    end
    

    def reveal(pos)
        if revealed?(pos)
            puts "This position has been revealed earlier"
        else
            self[pos].reveal
        end
        self[pos].value       
    end

    def revealed?(pos)
        self[pos].revealed?
    end
    

    private

    attr_reader :grid
    
end

