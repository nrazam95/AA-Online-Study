require"./item.rb"
CHECKMARK = "\u2713".force_encoding('utf-8')

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @item = []
    end

    def label=(str)
        @label = str
    end
    

    def add_item(title, deadline, descriptions = ' ')
        if @item << Item.new(title, deadline, descriptions)
            true
        else 
            false
        end
    end
    
    def size
        @item.count
    end

    def valid_index?(index)
        indices = []

        @item.each_with_index do |t, i|
            indices << i
        end

        if indices.include?(index)
            return true
        else
            false
        end
    end
    
    def swap(index_1, index_2)
        
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @item[index_1], @item[index_2] = @item[index_2], @item[index_1]
        end
            
    end
    
    def [](index)
        if self.valid_index?(index) == true
            @item[index].title
        else
            nil
        end
    end
    
    def priority
        @item.first
    end
    
    def print
        puts "."*50
        puts "          #{self.label.upcase}          "
        puts "."*50
        puts "#{"Index".ljust(7)} | #{"Item".ljust(20)} | #{"Deadline".ljust(10)} | #{"Status".ljust(10)}"

        @item.each_with_index do |t, i|
            status = t.done ? CHECKMARK : ' '
            puts "#{i.to_s.ljust(7)} | #{t.title.ljust(20)} | #{t.deadline.ljust(10)} | [#{status}]"
        end
        puts "."*50
    end

    def print_full_item(index)
        status = @item[index].done ? CHECKMARK : ' '
        puts "."*50
        puts "#{@item[index].title.to_s.ljust(20)} | #{@item[index].deadline.to_s.ljust(10)} | [#{status}]"
        puts @item[index].descriptions.to_s.ljust(40)
        puts "."*50
    end
    
    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        if !self.valid_index?(index)
            raise "Invalid Index"
        end 

        i = index
        a = amount

        while i > 0 && a > 0
            self.swap(i - 1, i)
            i -= 1
            a -= 1
        end
        
        return true
    end

    def down(index, amount = 1)
        if !self.valid_index?(index)
            raise "Invalid Index"
        end 

        i = index
        a = amount

        while i <= @item.length && a > 0
            self.swap(i, i + 1)
            i -= 1
            a -= 1
        end
        
        return true
    end
    
    def sort_by_date!
        @item.sort_by! {|item| item.deadline }
    end   

    def toggle_item(index)
        @item[index].toggle
    end

    def remove_item(index)
        @item[index].delete
    end
    
    def purge
        @items.delete_if(&:done)
    end
    

    
end