require "./lib/connect_four"
describe Player do
    it "create a player" do
        player = Player.new("player1")
        expect(player.name).to eql("player1")
    end

    it "store player 1 piece" do
        player = Player.new("player1")
        expect(player.piece).to eql("X")
    end

    it "store player 2 piece" do
        player2 = Player.new("player2")
        expect(player2.piece).to eql("O")
    end
end



describe Board do
    describe "#buildboard" do
        it "should create a 7x6(high) grid" do
            test = Board.new
            expect(test.array.flatten.length).to eql(42)
        end

        it "the grid should be empty" do
            test = Board.new
            expect(test.array.flatten.all? {|value| value == '.' }).to equal(true)
        end
    end

    describe "#check_winner" do
        it "should return true if there are 4 pieces of the same 'color' in a horizontal order" do
            test = Board.new
            player = Player.new("player1")
            test.array[0][3] = "#{player.piece}" 
            test.array[0][4] = "#{player.piece}" 
            test.array[0][5] = "#{player.piece}" 
            test.array[0][6] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end

        it "should return true if there are 4 pieces of the same 'color' in a horizontal order" do
            test = Board.new
            player = Player.new("player1")
            test.array[5][1] = "#{player.piece}" 
            test.array[5][2] = "#{player.piece}" 
            test.array[5][3] = "#{player.piece}" 
            test.array[5][4] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end

        it "should return true if there are 4 pieces of the same 'color' in vertical order" do
            test = Board.new
            player = Player.new("player1")
            test.array[0][5] = "#{player.piece}" 
            test.array[1][5] = "#{player.piece}" 
            test.array[2][5] = "#{player.piece}" 
            test.array[3][5] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end

        it "should return true if there are 4 pieces of the same 'color' in descending diagonol order" do
            test = Board.new
            player = Player.new("player1")
            test.array[0][0] = "#{player.piece}" 
            test.array[1][1] = "#{player.piece}" 
            test.array[2][2] = "#{player.piece}" 
            test.array[3][3] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end

        it "should return true if there are 4 pieces of the same 'color' in ascending diagonol order" do
            test = Board.new
            player = Player.new("player1")
            test.array[5][0] = "#{player.piece}" 
            test.array[4][1] = "#{player.piece}" 
            test.array[3][2] = "#{player.piece}" 
            test.array[2][3] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end

        it "should return true if there are 4 pieces of the same 'color' in ascending diagonol order" do
            test = Board.new
            player = Player.new("player1")
            test.array[5][3] = "#{player.piece}" 
            test.array[4][4] = "#{player.piece}" 
            test.array[3][5] = "#{player.piece}" 
            test.array[2][6] = "#{player.piece}" 
            test.print_board()
            expect(test.check_winner(player)).to eql(true)
        end
    end
end

=begin

describe Game do
    describe "#player_selection" do
        it "have the player make a selection" do
            test = Game.new
            allow_any_instance_of(Object).to receive(:gets).and_return "1\n"
            expect(test.board.array[0][0]).to eql("| X |")
        end

        it "should return false when an invalid selection is made" do
            test = GamePlay.new()
            allow_any_instance_of(Object).to receive(:gets).and_return "10\n"
            

            expect(board.selection(player1)).to eql(false)

        end

        it "should place the players piece on the board correctly" do
            expect().to eql()
        end

        it "should advance to the next players turn" do
            test_game = Game.new
            test_game.player_turn
            expect(test_game.turn).to eql(2)
        end
    end
end
=end