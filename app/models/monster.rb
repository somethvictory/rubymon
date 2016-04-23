class Monster < ActiveRecord::Base
  validates  :name, presence: true
  validates  :power, presence: true
  validates  :monster_type, presence: true

  validate   :valid_number_per_user

  belongs_to :user
  belongs_to :monster_type
  belongs_to :monster_team

  def self.sort_by(params)
    order(params[:sort_by])
  end

  private
  def valid_number_per_user
    if new_record?
      errors.add(:base, 'You cannot create more than 20 monsters') if user && user.monsters.count >= 20
    end
  end
end
