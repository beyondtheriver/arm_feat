class CreateStatCharts < ActiveRecord::Migration
  def change
    create_table :stat_charts do |t|
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.float :wpm
      t.boolean :game_champion

      t.timestamps null: false
    end
  end
end
