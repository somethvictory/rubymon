class AddOverPowerIdToMonsterTypes < ActiveRecord::Migration
  def change
    add_column :monster_types, :over_power_id, :integer
  end
end
