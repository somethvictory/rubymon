class MonsterTeam < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }

  validate :valid_number_of_teams_per_user
  validate :only_three_monsters_permitted

  belongs_to :user

  has_many :monsters

  private
  def valid_number_of_teams_per_user
    if new_record?
      errors.add(:base, 'You cannot create more than 3 monster teams') if user && user.monster_teams.count >= 3
    end
  end

  def only_three_monsters_permitted
    errors.add(:base, 'You could only have three monsters in a team') if monsters.size > 3
  end
end
