class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :schedule, foreign_key: true
      t.datetime :start
      t.string :location

      t.timestamps
    end
  end
end
