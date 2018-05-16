class AddScheduleToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :schedule, :string
  end
end
