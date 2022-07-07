require 'byebug'

def my_uniq(arr)
    new_arr = []

    arr.each do |ele|
        if !new_arr.include?(ele)
            new_arr << ele 
        end
    end

    new_arr
end

class Array
    def two_sum
        new_arr = []

        self.each_with_index do |ele, i|
            (i+1...self.length).each do |j|
                new_arr << [i, j] if self[j] + self[i] == 0
            end
        end

        new_arr
    end
end