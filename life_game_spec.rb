require './life_game.rb'

describe 'LifeGame' do

end

describe 'Grid' do
  subject { Grid.new(3, 3, [[0, 0], [0, 1], [1, 0]]) }
  its(:width) { should eq 3 }
  its(:height) { should eq 3 }
  describe '#next' do
    subject { Grid.new(3, 3, [[0, 0], [0, 1], [1, 0]]).next }
    its(:width) { should eq 3 }
    its(:height) { should eq 3 }
  end
  describe '#around_count' do
    before { @grid = Grid.new(3, 3, [[0, 0], [0, 1], [1, 0]]) }
    it { @grid.around_count(1, 1).should eq 3 }
    it { @grid.around_count(0, 0).should eq 2 }
  end
end
