require 'pry'


class Board
    
    attr_accessor :cells 

    def initialize
        @cells=Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input = input.to_i
        input -= 1 
        self.cells[input]
    end

    def reset!
        self.cells= Array.new(9, " ")
    end

    def full?
        @cells.all?{|pos|pos=="X"||pos=="O"}
    end

    def turn_count
        count=0
        @cells.each do |pos|
            if pos == "X" || pos=="O"
                count +=1
            end
        end
        count 
    end

    def taken?(index)
        index = index.to_i - 1
        @cells[index] == "X"||@cells[index] =="O" ? true : false    
    end

    def valid_move?(index)
        new_index = index.to_i - 1
        !taken?(index) && new_index.between?(0,8) ? true : false 
    end

    def update(input,player)
        index = input.to_i - 1
        self.cells[index] = player.token 
    end
end