require "spec_helper"

# module SnakesAndLadders
#   describe TurnManager do
#     let(:turn_manager) { TurnManager.new }

#     describe "#initialize" do
#       it "defaults players to an empty array" do
#         expect(turn_manager.players).to eq []
#       end

#       it "sets players" do
#         turn_manager = TurnManager.new(players: ["mario"])
#         expect(turn_manager.players).to eq ["mario"]
#       end

#       it "defaults counter to 0" do
#         expect(turn_manager.counter).to eq 0
#       end
#     end

#     describe "#players" do
#       skip "returns an array" do
#         expect(turn_manager.players).to be_an Array
#       end
#     end

#     describe "#turn" do
#       it "returns an Integer" do
#         expect(turn_manager.counter).to be_an Integer
#       end
#     end

#     describe "#next_player" do
#       let(:turn_manager) { TurnManager.new(players: ["Mario", "Luigi", "Peach"]) }

#       it "returns the player whose turn is up next" do
#         expect(turn_manager.next_player).to eq "Mario"
#       end

#       it "increments counter" do
#         turn_manager.next_player
#         expect(turn_manager.counter).to eq 1
#       end

#       it "cycles turns" do
#         expect(turn_manager.next_player).to eq "Mario"
#         expect(turn_manager.next_player).to eq "Luigi"
#         expect(turn_manager.next_player).to eq "Peach"
#         expect(turn_manager.next_player).to eq "Mario"
#         expect(turn_manager.counter).to eq 4
#       end
#     end
#   end
# end
