class Card
    ALPHA = ("A".."Z").to_a

    def self.shuffled_array(needed)
        alpha = ALPHA

        while needed > alpha.length
            alpha = alpha + alpha
        end
        
        alpha = alpha.shuffle.take(needed) * 2
        alpha.shuffle!
        alpha.map { |alp| self.new(alp) }        
    end
    
    attr_reader :value

    def initialize(value, face_up = false)
        @value = value
        @face_up = face_up
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def revealed?
        @face_up
    end
    
    def to_s
        revealed? ? value.to_s : " "
    end

    def ==(card)
        card.is_a?(self.class) && card.value == value
    end
end
