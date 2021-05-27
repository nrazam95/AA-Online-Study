class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
      DICTIONARY.sample
  end
  
  def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
      @remaining_incorrect_guesses
  end

  def already_attempted?(str)
      @attempted_chars.map.include?(str)
  end

  def get_matching_indices(str)
      indices = []
      @secret_word.each_char.with_index do |char, i|
        if char == str
          indices << i
        end
      end
      indices
  end
  
  def fill_indices(str, array)  
      array.each do |num|
        @guess_word[num] = str
      end
      @guess_word
  end
  

  def try_guess(str)

      if self.already_attempted?(str)
        p "already"
        return false
      end

      @attempted_chars << str

      self.fill_indices(str, self.get_matching_indices(str))
      
      @remaining_incorrect_guesses -= 1 if self.get_matching_indices(str).empty?

      true
  end
  
  def ask_user_for_guess
      p "Enter a char"
      char = gets.chomp.downcase
      self.try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
