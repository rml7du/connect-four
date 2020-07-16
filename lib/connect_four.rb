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
        array = Array.new(6) { Array.new(7) { '.'}} 
    end

    def print_board()
        puts "----select a column-----"
        print " 1 2 3 4 5 6 7\n"
        @array.each {|x| print "|#{x.join('|')}|\n"}
        puts ""
    end

    def place_piece(player, x) #drop piece in correct column
        if @array[5][x] == "."
            @array[5][x] = "#{player.piece}" 
        elsif @array[4][x] == "."
            @array[4][x] = "#{player.piece}" 
        elsif @array[3][x] == "."
            @array[3][x] = "#{player.piece}"
        elsif @array[2][x] == "."
            @array[2][x] = "#{player.piece}" 
        elsif @array[1][x] == "."
            @array[1][x] = "#{player.piece}" 
        elsif @array[0][x] == "."
            @array[0][x] = "#{player.piece}" 
        end
    end

    def check_winner(player)
        #horizontal check
        h = 0
      
        while h < 6
            w = 0
            while w < 7 - 3
                return true if @array[h][w] == "#{player.piece}" && @array[h][w+1] == "#{player.piece}" && @array[h][w+2] == "#{player.piece}" && @array[h][w+3] == "#{player.piece}"
                w += 1
            end
            h+=1
        end

        #vertical check
        h = 0
        
        while h < 6 - 3
            w = 0
            while w < 7
                return true if @array[h][w] == "#{player.piece}" && @array[h+1][w] == "#{player.piece}" && @array[h+2][w] == "#{player.piece}" && @array[h+3][w] == "#{player.piece}" 
                w+=1
            end
            h+=1
        end

        #ascending diagnol check
        h = 3 #because limitations on ascending diagnol
        while h < 6
            w = 0 
            while w < 7-3
                return true if @array[h][w] == "#{player.piece}" && @array[h-1][w+1] == "#{player.piece}" && @array[h-2][w+2] == "#{player.piece}" && @array[h-3][w+3] == "#{player.piece}"
                w+=1
            end
            h+=1
        end

        #descending diagnol check
        h = 0
        while h < 3
            w = 0 
            while w < 7 - 3
                return true if @array[h][w] == "#{player.piece}" && @array[h+1][w+1] == "#{player.piece}" && @array[h+2][w+2] == "#{player.piece}" && @array[h+3][w+3] == "#{player.piece}"  
                w+=1
            end
            h+=1
        end   
    end
end

class Game
    attr_accessor :turn, :board
    def initialize()
        @turn = 1
        @player1 = Player.new("player1")
        @player2 = Player.new("player2")
        @board = Board.new()
        gameplay()
    end
    
    def gameplay()
        while @board.array.flatten.any? { |x| x == '.' } #total possible turns
            if @turn % 2 == 1
                current_player = @player1
            else
                current_player = @player2
            end
            player_turn(current_player)
            if @board.check_winner(current_player)
                @board.print_board
                puts "WINNER! #{current_player.name} wins the game"
                break
            end
            @turn +=1
        end
        if @board.array.flatten.none? {|x| x == '.'}
            @board.print_board
            puts "ITS A TIE!"
        end    
    end

    def player_turn(player)
        @board.print_board
        puts "select a column 1-7"
        while !selection(player)
        end
    end

    def selection(player)
        selection = gets.chomp.to_i - 1
        if !('0'..'6').include?("#{selection}")
            puts "invalid selection, please try again"
            return false
        elsif @board.array[0][selection] != "."
            puts "that space is taken, try again"
            return false
        else @board.place_piece(player,selection)
            return true
        end
    end
end


game = Game.new

=begin
aries = "\u2648".encode('utf-8')
mountain = "\u26F0".encode('utf-8')
puts mountain
puts aries
=end