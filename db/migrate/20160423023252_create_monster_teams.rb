class CreateMonsterTeams < ActiveRecord::Migration
  def change
    create_table :monster_teams do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
