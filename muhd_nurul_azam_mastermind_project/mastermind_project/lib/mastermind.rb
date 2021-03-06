require_relative "code"

class Mastermind

        def initialize(length)
            @secret_code = Code.random(length)
        end
        
        def print_matches(coding)
            p "exact matches: #{@secret_code.num_exact_matches(coding)}"
            p "near matches: #{@secret_code.num_near_matches(coding)}"
        end


        def ask_user_for_guess
            p "Enter a code"
            response = gets.chomp
            guess = Code.from_string(response)
            self.print_matches(guess)
            @secret_code == guess
        end
        

end
