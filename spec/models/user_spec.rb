require 'rails_helper'

RSpec.describe User, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
end

RSpec.describe User, 'association', type: :model do
  it { is_expected.to have_many(:monsters) }
  it { is_expected.to have_many(:monster_teams) }
end
