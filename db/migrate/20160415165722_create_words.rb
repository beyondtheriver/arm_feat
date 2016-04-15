class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.integer :difficulty
      t.integer :length

      t.timestamps null: false
    end
  end
end
