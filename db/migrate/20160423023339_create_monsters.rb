class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :power

      t.references :monster_team
      t.references :monster_type
      t.references :user

      t.timestamps
    end
  end
end
