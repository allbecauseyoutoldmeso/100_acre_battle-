require 'player'
# rspec tests
describe Player do
  subject(:emily) {described_class.new('Emily')}

    describe '#name' do
      it 'returns player name' do
        expect(emily.name).to eq 'Emily'
      end
    end
end
