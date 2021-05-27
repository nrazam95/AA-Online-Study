class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end
    
    
    def [](array)
        r = array[0]
        c = array[1]
        @grid[r][c]
    end

    def []=(array, ele)
        r = array[0]
        c = array[1]
        @grid[r][c] = ele 
    end
    
    def num_ships
        count = 0
        @grid.each do |arrays|
            arrays.each do |val|
                if val != :N
                    count += 1
                end
            end
        end
        count
    end
    
    #Part 2

    def attack(array)
        if self[array] == :S
            self[array] = :H
            p "You sunk my battleship"
            return true
        else 
            self[array] = :X
            return false
        end
    end
    
    def place_random_ships
        ships = 0.25 * @size
        
        while self.num_ships < ships
            r = rand(0...@grid.length)
            c = rand(0...@grid.length)
            array = [r, c]
            self[array] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |array|
            array.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end
    

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(self.hidden_ships_grid)
    end 
    
    def self.print_grid(grid)
        grid.each do |array|
            puts array.join(" ")
        end
    end
    

end
