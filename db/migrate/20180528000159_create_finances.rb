class CreateFinances < ActiveRecord::Migration[5.1]
  def change
    create_table :finances do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
