class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end
    
    def guess(fragment)
        puts "Your current fragment is '#{fragment}'"
        puts "\nEnter Your Guess, #{name}:"
        gets.chomp.to_s(&:downcase)
    end

    def alert_invalid_guess(letter)
        puts "#{letter} is not valid"
        puts "You must be able to form a word starting with the fragment"
    end
    
    def to_s
        name        
    end
    
end