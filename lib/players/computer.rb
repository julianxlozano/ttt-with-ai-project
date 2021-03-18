module Players 
    class Computer < Player
      def move(board)
        if board.turn_count == 0 && board.taken?("5") == false 
            "5"
        end
      end
    end 
end 