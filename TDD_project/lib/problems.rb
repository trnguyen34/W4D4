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

def my_transpose(arr) 
    new_arr = []

    arr.each_with_index do |ele, i|
        temp_arr = []
        (0 ... ele.length).each do |j| 
            temp_arr << arr[j][i] 
        end
        new_arr << temp_arr
    end
    new_arr
    
end

def stock_picker(arr)
    most_profitable_days = [0,0]
    profit = 0

    arr.each_with_index do |price, i|
        (i + 1 ... arr.length).each do |j|
            if arr[j] - arr[i] > profit
                most_profitable_days = [i, j]
                profit = arr[j] - arr[i]
            end
        end
    end
    most_profitable_days
end

class TowersOfHanoi

    attr_reader :array1, :array2, :array3
    # each array can be its own number. 
    def initialize
        @array1 = [3,2,1]
        @array2 = []
        @array3 = []

    end

    def move(arr1, arr2) 
        raise "not valid" if !valid_move?(arr1, arr2)
        arr2 << arr1.pop

    end

    def valid_move?(arr1, arr2)
        raise "stack is empty, pick another stack" if arr1.empty?
        disk = arr1[-1] 
        return true if  arr2.empty? || disk < arr2[-1]
        false
    end

    def won? 
        @array3 == [3,2,1]
        puts " YOU WON!"
    end

    def play

        while !won? 
            begin
            self.renderer 
            puts " enter two numbers, tower moving from and tower moving to. ex: 2 3"
            input = gets.chomp.split(" ")
            input.map! {|ele| ele.to_i}
            
            move(array_picker(input.first), array_picker(input.last))
            rescue RuntimeError
                puts "its not valid" 
            end
        end
    end

    def array_picker(num)
        if num == 1
            @array1
        elsif num == 2
            @array2
        else
            @array3
        end
    end

    def renderer
        p @array1 
        p @array2
        p @array3
    end
end

tower = TowersOfHanoi.new
tower.play