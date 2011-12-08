require './life_game.rb'

describe 'LifeGame' do

end

describe 'Grid' do
  subject { Grid.new(3, 3) }
  its(:width) { should eq 3 }
  its(:height) { should eq 3 }
end
