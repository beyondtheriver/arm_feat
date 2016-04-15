class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.integer :level
      t.integer :boss_id

      t.timestamps null: false
    end
  end
end
