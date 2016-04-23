class MonsterType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :over_power, class_name: 'MonsterType'
  has_one    :under_power, class_name: 'MonsterType', foreign_key: :over_power_id
end
