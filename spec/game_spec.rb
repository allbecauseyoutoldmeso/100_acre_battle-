require 'game'

  describe Game do
    subject(:game) { described_class.new(player_1, player_2)}
    let(:player_1) {double :player, :hp => 0}
    let(:player_2) {double :player, :hp => 0}

    describe '#attack' do
      it 'attacks a player' do
        expect(player_2).to receive(:receive_damage)
        game.attack(player_2)
      end
    end

    describe '#finish?' do
      it 'finishes the game' do
        game.finish?
        expect(game).to be_finish
      end
    end

    describe '#current_turn' do
      it 'returns the player whose turn it is' do
        expect(game.current_turn).to eq player_1
      end
    end

    describe '#switch_turn' do
      it 'switches the turn' do
        game.switch_turn
        expect(game.current_turn).to eq player_2
      end
    end

  end
