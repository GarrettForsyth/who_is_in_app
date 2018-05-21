class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :author, index: true

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :author_id
  end
end
