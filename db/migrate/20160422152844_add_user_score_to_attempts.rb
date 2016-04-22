class AddUserScoreToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :user_score, :integer
  end
end
