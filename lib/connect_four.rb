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
        @@player_count % 2 == 1 ? "O" : "X" #can change this to make the pieces more interesting
    end
end

class Board
    attr_accessor :array
    def initialize()
        @array = create_board()
    end

    def create_board()
        array = Array.new(6) { Array.new(7) { '| . |'}}
    end

    def print_board()
        puts "----------select a column---------"
        print "  1    2    3    4    5    6    7\n"
        @array.each {|x| print "#{x.join('')}\n"}
        puts ""
    end

    def place_piece(player, x) #drop piece in correct column
        return false if @array[0][x] != "| . |"
        if @array[5][x] == "| . |"
            @array[5][x] = "| #{player.piece} |" 
            return true
        elsif @array[4][x] == "| . |"
            @array[4][x] = "| #{player.piece} |" 
            return true
        elsif @array[3][x] == "| . |"
            @array[3][x] = "| #{player.piece} |"
            return true
        elsif @array[2][x] == "| . |"
            @array[2][x] = "| #{player.piece} |" 
            return true
        elsif @array[1][x] == "| . |"
            @array[1][x] = "| #{player.piece} |" 
            return true
        elsif @array[0][x] == "| . |"
            @array[0][x] = "| #{player.piece} |" 
            return true
        end
    end

    def check_winner(player)
        # horizontalCheck 
        j = 0
        i = 0
        while j < 7-3 #width 
            while i < 6
                return true if @array[i][j] == "| #{player.piece} |" && @array[i][j+1] == "| #{player.piece} |" && @array[i][j+2] == "| #{player.piece} |" && @array[i][j+3] == "| #{player.piece} |"
                i +=1
            end
            j += 1    
        end

        # verticalCheck
        j = 0
        i = 0
        while i< 7-3 
            while j < 6
                return true if @array[i][j] == "| #{player.piece} |" && @array[i+1][j] == "| #{player.piece} |" && @array[i+2][j] == "| #{player.piece} |" && @array[i+3][j] == "| #{player.piece} |"
                j+=1
            end
            i+=1
        end
        # ascendingDiagonalCheck 
        j = 3
        i = 3
        while i < 7
            while j < 6
                return true if @array[i][j] == "| #{player.piece} |" && @array[i-1][j+1] == "| #{player.piece} |" && @array[i-2][j+2] == "| #{player.piece} |" && @array[i-3][j+3] == "| #{player.piece} |"
                j+=1
            end
            i+=1
        end
        # descendingDiagonalCheck
        j = 3
        i = 3
        while i < 7
            while j < 6
                return true if @array[i][j] == "| #{player.piece} |" && @array[i-1][j-1] == "| #{player.piece} |" && @array[i-2][j-2] == "| #{player.piece} |" && @array[i-3][j-3] == "| #{player.piece} |"                
                j+=1
            end
            i+=1
        end
        return false;
    end
end

class Game
    attr_accessor :turn
    def initialize()
        @turn = 1
        @player1 = Player.new("player1")
        @player2 = Player.new("player2")
        @board = Board.new()
        gameplay()
    end
    
    def gameplay()
        while @turn < 1 #total possible turns
            if @turn % 2 == 1
                current_player = @player1
            else
                current_player = @player2
            end
            player_turn(current_player)
            if @board.check_winner(current_player)
                puts "WINNER! #{current_player} wins the game"
                @board.print_board
                break
            end
            @turn +=1
        end
    end

    def player_turn(player)
        @board.print_board
        puts "select a column 1-7"
        selection(player) 
    end

    def selection(player)
        selection = gets.chomp.to_i - 1
        if !('0'..'6').include?("#{selection}")
            puts "invalid selection, please try again"
            return false
        elsif @board.place_piece(player,selection) == false
            puts "that space is taken, try again"
            return false
        else 
            @board.place_piece(player,selection)
            return true
        end
    end
end


#game = Game.new

=begin
aries = "\u2648".encode('utf-8')
mountain = "\u26F0".encode('utf-8')
puts mountain
puts aries
=end