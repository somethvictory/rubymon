class CreateMonsterType < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.string :name, default: ''

      t.timestamps
    end
  end
end
