class Item
    attr_reader :title, :deadline, :descriptions

    def valid_date?(str)
        new_str = str.split("-")
        year = new_str[0]
        month = new_str[1].to_i
        days = new_str[2].to_i

        if year.length == 4 && month <= 12 && days <= 31
            true
            str
        else
            false
            raise "put the date with standards YYYY-MM-DD"
        end
    end
    
    def initialize(title, deadline, descriptions)
        @title = title
        @deadline = self.valid_date?(deadline)
        @descriptions = descriptions

    end
    
    def title=(str)
        @title = str
    end
    
    def deadline=(str)
        @deadline = self.valid_date?(str)
    end
    
    def descriptions=(str)
        @description = str
    end
    
    

end