require "./lib/connect_four"
describe Player do

    it "store player 1 piece" do
        player = Player.new("player1")
        expect(player.piece).to eql("O")
    end
    
    it "create a player" do
        player = Player.new("player1")
        expect(player.name).to eql("player1")
    end

    it "store player 2 piece" do
        player2 = Player.new("player2")
        expect(player2.piece).to eql("X")
    end

end

describe Game do
    describe "#somefunction" do
        it "shoudl do something" do
            expect().to eql()
        end
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
            expect(test.array.flatten.all? {|value| value == ' ' }).to equal(true)
        end
    end

    describe "#check_winner" do
        it "should return true if there are 4 pieces of the same 'color' in a row" do
            test = Board.new
            player = Player.new("player1")
            test.array[0][0] = "X"
            test.array[0][1] = "X"
            test.array[0][2] = "X"
            test.array[0][3] = "X"
            expect(test.check_winner(player)).to eql(true)
        end
    end
end
