require_relative "room"

class Hotel
  
    def initialize(name, level)
        @name = name
        @rooms = {}

        level.each do |room_level, capacity| 
            @rooms[room_level] = Room.new(capacity)
        end
    end
    
    def name
        new_name = @name.split(" ").map { |word| word.capitalize}
        new_name.join(" ")
    end

    def rooms
        @rooms
    end
    
    def room_exists?(str)
        if @rooms.has_key?(str)
            return true
        else
            return false
        end
    end
    
    def check_in(name, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(name)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end
    
    def has_vacancy?
        return true if @rooms.values.any? { |val| val.available_space > 0}
        return false if @rooms.values.all? { |val| val.available_space == 0}
    end
    
    def list_rooms
        @rooms.each do |room_level, room|
            puts "#{room_level} => #{room.available_space}"
        end
    end
end
