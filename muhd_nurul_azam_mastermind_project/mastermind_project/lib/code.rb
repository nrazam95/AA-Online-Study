class Code
  POSSIBLE_PEGS = {"R" => :red, "G" => :green, "B" => :blue, "Y" => :yellow}

  def self.valid_pegs?(array)
    new_array = []
    new_arr = array.map {|element| element.upcase}
    new_arr.each do |ele|   
        POSSIBLE_PEGS.keys.each do |char|
          if char == ele
            new_array << ele
          end
        end
    end

    if new_array == new_arr
      return true
    else
      return false      
    end
    
  end
  
  attr_reader :pegs

  def initialize(array)
      if Code.valid_pegs?(array) == true
        @pegs = array.map {|ele| ele.upcase}
      else
        raise "No words included"
      end
  end

  def self.random(length)
      Code.new(Array.new(length, POSSIBLE_PEGS.keys.sample))
  end
  
  def self.from_string(str)
      new_array = str.split("").map { |ele| ele.upcase}
      Code.new(new_array)      
  end

  def [](num)
      @pegs[num]
  end

  def length
      @pegs.length
  end
  
  #Part 2

  def num_exact_matches(coding)
        count = 0
        (0...coding.pegs.length).each do |i|
            if self[i] == coding[i]
              count += 1
            end
        end
        count
  end
  

  def num_near_matches(coding)
        count = 0
        (0...coding.pegs.length).each do |i|
            if self[i] != coding[i] && self.pegs.include?(coding[i])
                count += 1
            end
        end
        count
  end
  

  def ==(other_code)
      if self.pegs == other_code.pegs
        return true
      else
        return false
      end
  end
  
end
