require_relative "tile"

class Board
    

    def initialize(grid = Board.empty_board)
        @grid = grid
    end

    def self.empty_board
        Array.new(9) do 
            Array.new(9) {Tile.new(0)}
        end
    end

    def self.from_file(file)
        rows = File.readlines(file).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split("").map {|num| Integer(num)} 
            nums.map {|i| Tile.new(i)}
        end
        self.new(tiles)        
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        tile = grid[row][col]
        tile.value = value
    end

    def rows
        grid
    end

    def columns
        rows.transpose
    end
    
    def size
        grid.size
    end

    def render
        puts " #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, i|
            puts "#{i} #{row.join(" ")}"
        end        
    end

    def solved?
        rows.all? { |row| solved_ones(row)} &&
            columns.all? { |column| solved_ones(column)} &&
            squares.all? { |square| solved_ones(square)}
    end
        
    def solved_ones(tiles)
        nums = tiles.map(&:value)
        nums.sort == (1..9).to_a
    end
    
    def square(i)
        tiles = []

        a = (i / 3) * 3
        b = (i % 3) * 3

        (a...a + 3).each do |i|
            (b...b + 3).each do |j|
                tiles << self[[i,j]]
            end
        end
        tiles
    end

    def squares
        (0..8).to_a.map {|i| square(i)}
    end

    def dup
        duped_one = grid.map do |row|
            row.map { |tile| Tile.new(tile.value)}
        end
        Board.new(duped_one)
    end

    private

    attr_reader :grid  
    
    
end