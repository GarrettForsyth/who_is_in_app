class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :image
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
