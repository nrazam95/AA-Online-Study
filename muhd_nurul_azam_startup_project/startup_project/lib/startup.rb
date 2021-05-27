require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @employees = []
        @salaries = {}

        salaries.each do |title, salary| 
            @salaries[title] = salary
        end        
    end

    def valid_title?(str)
        return true if @salaries.keys.map.any?(str)
        return false
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end
    
    def hire(name, title)
        if valid_title?(title) == true
            @employees << Employee.new(name, title)
        else
            raise "title is invalid"
        end
    end
    
    def size
        self.employees.length
    end

    def pay_employee(employee)
        salary_to_pay = @salaries[employee.title]

        if @funding > salary_to_pay
            employee.pay(salary_to_pay)
            @funding -= salary_to_pay
        else
            raise "funding is not enough"
        end
    end

    def payday
        self.employees.map { |employee| self.pay_employee(employee)}
    end

    #Part 3

    def average_salary
        new_array = []
        
        @employees.each do |employee|
            new_array << @salaries[employee.title]
        end
        avg = new_array.sum / new_array.length
        avg
    end
    
    
    def close
        @employees = []
        @funding = 0
    end
    
    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        @employees += startup.employees
        startup.close()
    end
    
    
    

    
end
