class Player
    attr_accessor :name, :piece
    @@player_count = 0

    def initialize(name)
        @@player_count =+ 1
        @name = name
        @piece = pick_piece()
    end

    def pick_piece()
        @player_count == 1 ? "O" : "X" #can change this to make the pieces more interesting
    end
end

class Game
end

class Board
end

