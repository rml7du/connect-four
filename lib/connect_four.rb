class Player
    attr_accessor :name, :piece, :player_count
    @@player_count = 0

    def initialize(name)
        @@player_count += 1
        @name = name
        @piece = pick_piece()
    end

    def self.player_count
        # Return the value of this variable
        @@player_count
    end

    def pick_piece()
        @@player_count == 1 ? "O" : "X" #can change this to make the pieces more interesting
    end
end

class Game
end

class Board
    attr_accessor :array
    def initialize()
        @array = create_board()
    end

    def create_board()
        array = Array.new(6) { Array.new(7) { ' '}}
    end

    def print_board()
        board.array.each {|x| print "#{x}\n"}
        puts ""
    end

    def check_winner(player)
        # horizontalCheck 
        j = 0
        i = 0
        while j < 7-3 #width 
            while i < 6
                return true if @array[i][j] == player.piece && @array[i][j+1] == player.piece && @array[i][j+2] == player.piece && @array[i][j+3] == player.piece
                i +=1
            end
            j += 1    
        end

        # verticalCheck
        j = 0
        i = 0
        while i< 7-3 
            while j < 6
                return true if @array[i][j] == player.piece && @array[i+1][j] == player.piece && @array[i+2][j] == player.piece && @array[i+3][j] == player.piece
                j+=1
            end
            i+=1
        end
        # ascendingDiagonalCheck 
        j = 3
        i = 3
        while i < 7
            while j < 6
                return true if @array[i][j] == player.piece && @array[i-1][j+1] == player.piece && @array[i-2][j+2] == player.piece && @array[i-3][j+3] == player.piece
                j+=1
            end
            i+=1
        end
        # descendingDiagonalCheck
        j = 3
        i = 3
        while i < 7
            while j < 6
                return true if @array[i][j] == player.piece && @array[i-1][j-1] == player.piece && @array[i-2][j-2] == player.piece && @array[i-3][j-3] == player.piece                
                j+=1
            end
            i+=1
        end
        return false;
    end
end
=begin
board = Board.new
player = Player.new("player")
player2 = Player.new("player2")
puts player.piece
puts player2.piece
puts ""
#puts player_count
puts Player.player_count

board.array[0][0] = "O"
board.array[0][1] = "O"
board.array[0][2] = "O"
board.array[0][3] = "O"


puts""

puts board.array[0][0] == player.piece
puts board.check_winner(player)
=end