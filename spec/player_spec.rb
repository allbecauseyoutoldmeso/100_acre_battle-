require 'player'
# rspec tests
describe Player do
  subject(:player_1) {described_class.new('Emily', 10 )}
  subject(:player_2) {described_class.new('Jessica', 10 )}

    describe '#name' do
      it 'returns player name' do
        expect(player_1.name).to eq 'Emily'
      end
    end

    describe '#hp' do
      it 'returns the hit points' do
        expect(player_1.hp).to eq described_class::DEFAULT_HIT_POINTS
      end
    end

    describe '#attack' do
      it 'damages the player' do
        expect(player_2).to receive(:receive_damage)
        player_1.attack(player_2)
      end
    end

    describe '#receive_damage' do
      it 'reduces the player hp' do
        expect { player_2.receive_damage }.to change { player_2.hp }.by(-2)
      end
    end

end
