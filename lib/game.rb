require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS= [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
      ]    

      def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
         @player_1 = player_1
         @player_2 = player_2
         @board = board 
      end

      def current_player
         @board.turn_count.even? ? @player_1 : @player_2  
      end
      
      def won?
        WIN_COMBINATIONS.detect do |combo|
          combo.all?{|index|@board.cells[index] == "X"} ||
          combo.all?{|index|@board.cells[index] == "O"}
        end
      end

      def draw?
         self.board.cells.all?{|pos|pos=="X"||pos=="O"} && !won?
      end

      def over?
        if draw? 
         true 
        elsif won? 
         true 
        else
         false 
        end
      end

      def winner
         won? ? won?.each{|num| return self.board.cells[num]}  : nil 
      end

      def turn 
         move= current_player.move(@board)
         self.board.valid_move?(move) ? self.board.update(move,current_player) : turn 
      end 

      def play 
        until over?
          turn 
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw? 
           puts "Cat's Game!"   
        end
      end

      
end
