class AddNameToMonsterTeams < ActiveRecord::Migration
  def change
    add_column :monster_teams, :name, :string
  end
end
