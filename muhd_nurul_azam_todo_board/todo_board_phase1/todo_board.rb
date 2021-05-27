require "./list.rb"
require "./item.rb"

class TodoBoard
    

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'ToDo'
            @list.add_item(*args)
        when 'print'
            if args.empty?
                @list.print
            else 
                @list.print_full_item(args[0].to_i)
            end
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_prority
        when 'swap'
            @list.swap(*args.map(&:to_i))
        when 'up'
            @list.up(*args.map(&:to_i))
        when 'down'
            @list.down(*args.map(&:to_i))
        when 'quit'
            return false
        else
            puts "Sorry, unrecognized command."
        end

        true
    end
    
    def run
        until self.get_command == false
        end
    end
    
    
end