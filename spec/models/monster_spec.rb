require 'rails_helper'

RSpec.describe Monster, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:power) }
  it { is_expected.to validate_presence_of(:monster_type) }
end

RSpec.describe Monster, 'association', type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:monster_type) }
  it { is_expected.to belong_to(:monster_team) }
end

RSpec.describe Monster, 'custome validations', type: :model do
  it 'is not allowed a user to save more than 20 monsters' do
    user = create(:user)
    fire = create(:monster_type)
    create_list(:monster, 20, user: user, monster_type: fire)

    monster = user.monsters.build
    expect(monster).not_to be_valid
  end
end

RSpec.describe Monster, 'class method', type: :model do
  context 'when sorting' do
    before do
      user = create(:user)
      @m1 = create(:monster, name: 'zally', user: user, power: 'p3', monster_type: create(:monster_type, name: 'water'))
      @m2 = create(:monster, name: 'xaly', user:  user, power: 'p1', monster_type: create(:monster_type, name: 'electric'))
      @m3 = create(:monster, name: 'aly',  user:  user, power: 'p2', monster_type: create(:monster_type, name: 'earth'))
    end

    it 'reponds all monsters order by name' do
      expect(Monster.sort_by({sort_by: 'name'}).to_a).to eq [@m3, @m2, @m1]
    end

    it 'reponds all monsters order by power' do
      expect(Monster.sort_by({sort_by: 'power'}).to_a).to eq [@m2, @m3, @m1]
    end
  end
end

