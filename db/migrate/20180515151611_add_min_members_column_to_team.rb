class AddMinMembersColumnToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :min_members, :integer
  end
end
