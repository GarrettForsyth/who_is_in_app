class AddUniqueIndexToFinances < ActiveRecord::Migration[5.1]
  def change
    add_index :finances, [:user_id, :team_id], unique: true
  end
end
