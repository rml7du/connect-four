require "./lib/connect_four"
describe Player do

    it "create a player" do
        player = Player.new("player1")
        expect(player.name).to eql("player1")
    end

    it "store their piece" do
        player = Player.new("player1")
        expect(player.piece).to eql("X")
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
    describe "#somefunction" do
        it "shoudl do something" do
            expect().to eql()
        end
    end
end
