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

    describe '#switch_player' do
      it 'switches the players around' do
        game.switch_player
        expect(game.player_1).to eq player_2
      end
    end

    describe '#finish?' do
      it 'finishes the game' do
        game.finish?
        expect(game).to be_finish
      end
    end

  end
