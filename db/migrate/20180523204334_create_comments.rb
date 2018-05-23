class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :author, index: true
      t.references :message, index: true
      t.text :content

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :messages
  end
end
