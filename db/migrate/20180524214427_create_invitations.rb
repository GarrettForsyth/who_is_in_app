class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.references :from, index: true
      t.references :to, index: true

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :from_id
    add_foreign_key :invitations, :users, column: :to_id
  end
end
