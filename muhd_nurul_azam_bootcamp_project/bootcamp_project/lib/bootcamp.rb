class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |grades, students| grades[students] = [] }
    end
    
    def name
        @name
    end
    
    def slogan
        @slogan
    end
    
    def teachers
        @teachers
    end
    
    def students
        @students
    end
    
    def hire(str)
        @teachers << str 
    end
    
    def enroll(string)
        if @students.length < @student_capacity
            @students << string
            return true
        end
        false
    end

    def enrolled?(str)
        @students.map.include?(str)
    end
    
    def student_to_teacher_ratio
        ratio = @students.length / @teachers.length
        return ratio
    end
    
    def add_grade(str, value)
        if @students.map.include?(str)
            @grades[str] << value
            true
        else
            false
        end
    end
    
    def num_grades(string)
        @grades[string].length
    end

    def average_grade(string)
        if @grades[string].length > 0
            avg = @grades[string].sum / @grades[string].length
            avg
        else
            return nil
        end
    end
    
    
end
