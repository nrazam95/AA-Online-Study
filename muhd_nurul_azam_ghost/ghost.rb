require "set"
require_relative "player"

class Game

    ALPHABETS = Set.new("a".."z")
    MAX_LOSE = 5

    def initialize(*players)
        @players = players
        @dictionary = make_dictionary("dictionary.txt")
        @losses = Hash.new(0) 
        @players.each { |player| @losses[player] = 0 }
    end

    def make_dictionary(file)
        File.readlines(file).map(&:chomp).to_set
    end
    

    def run
        play_round until game_over?
        puts "#{winner} won the game!"
    end

    
    private

    attr_reader :dictionary, :players, :losses, :fragment

    def play_round
        @fragment = ""
        greets

        until round_over?
            take_turn
            next_player!
        end
        display        
    end

    def game_over?
        remaining_players == 1
    end

    
    #helper_method
    def greets
        system("clear")
        puts "\nHi, Lets play some Ghost Game"
        standings
    end

    def standings
        system("clear")
        players.each do |player|
            puts "#{player} : #{record(player)}"
        end

        sleep(4)
    end

    def round_over?
        is_word?(fragment)
    end
    
    def is_word?(fragment)
        dictionary.include?(fragment)
    end

    def add_letter(letter)
        fragment << letter
    end
    
    def current_player
        players.first
    end
    
    def take_turn
        system("clear")
        letter = nil

        until letter
            letter = current_player.guess(fragment)

            unless valid_play?(letter)
                current_player.alert_invalid_guess(letter)
                letter = nil
            end
        end

        add_letter(letter)
    end

    def next_player!
        players.rotate!
        players.rotate! until loses[current_player] < MAX_LOSE
    end

    def valid_play?(letter)
        return false unless ALPHABETS.include?(letter)

        upcoming_fragment = fragment + letter
        dictionary.any? { |word| word.start_with?(upcoming_fragment) }
    end

    def previous_player
        (players.count - 1).downto(0).each do |i|
            return players[i] if losses[players[i]] < MAX_LOSE
        end
    end

    def remaining_players
        losses.count {|k, v| v < MAX_LOSE}
    end

    def winner
        (player, v) = players.find {|k, v| v < MAX_LOSE}
        player
    end

    def record(player)
        losing = losses[player]
        "GHOST".slice(0, losing)
    end


    def display
        system("clear")
        puts "#{previous_player} has spelled the #{fragment}"
        sleep(4)

        if losses[previous_player] == MAX_LOSE - 1
            puts "#{previous_player} has been eliminated"
        end

        losses[previous_player] += 1

        standings       
    end  
end

if __FILE__  == $PROGRAM_NAME
    game = Game.new(Player.new("Gizmo"), Player.new("Breakfast"), Player.new("Toby"),Player.new("Leonardo"))

  game.run
end