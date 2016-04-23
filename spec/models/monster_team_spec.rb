require 'rails_helper'

RSpec.describe MonsterTeam, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:name) }
end

RSpec.describe MonsterTeam, 'association', type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:monsters) }
end

RSpec.describe MonsterTeam, 'custome validations', type: :model do
  before { @user = create(:user) }

  it 'is not allowed a user to create more than 3 monster team' do
    create_list(:monster_team, 3, user: @user)
    monster_team = @user.monster_teams.build

    expect(monster_team).not_to be_valid
  end

  it 'is not allowd a team to have more than 3 monsters' do
    mt = create(:monster_team, user: @user)
    water = build(:monster_type, name: 'Water')
    mt.monsters << build_list(:monster, 4, monster_type: water)

    expect(mt).not_to be_valid
  end
end
