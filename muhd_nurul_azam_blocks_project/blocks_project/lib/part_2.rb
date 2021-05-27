def all_words_capitalized?(array)
    array.all? { |words| words == words.capitalize}
end

def no_valid_url?(array)
    non_valid_one = ['.com', '.net', '.io', 'org']

    array.none? do |url|
        non_valid_one.any? { |endings| url.end_with?(endings)}
    end
end

def any_passing_students?(array)
    array.any? do |student| 
        grades = student[:grades]
        avg = grades.sum / (grades.length * 1.0)
        avg >= 75
    end    
end