require "./list.rb"

class TodoBoard
    

    def initialize
        @list = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, targets, *args = gets.chomp.split(' ')

        case cmd
        when 'ls'
            @list.keys.each {|label| puts ' ' + label }
        when 'showall'
            @list.each_value(&:print)
        when 'mklist'
            @list[targets] = List.new(targets)
        when 'mktodo'
            @list[targets].add_item(*args)
        when 'print'
            if args.empty?
                @list[targets].print
            else 
                @list[targets].print_full_item(args[0].to_i)
            end
        when 'sort'
            @list[targets].sort_by_date!
        when 'rm'
            @list[targets].remove_item(args[0].to_i)
        when 'toggle'
            @list[targets].toggle_item(args[0].to_i)
        when 'purge'
            @list[targets].purge
        when 'priority'
            @list[targets].print_prority
        when 'swap'
            @list[targets].swap(*args.map(&:to_i))
        when 'up'
            @list[targets].up(*args.map(&:to_i))
        when 'down'
            @list[targets].down(*args.map(&:to_i))
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

TodoBoard.new.run