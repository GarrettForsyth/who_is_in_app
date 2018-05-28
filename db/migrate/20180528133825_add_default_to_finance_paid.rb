class AddDefaultToFinancePaid < ActiveRecord::Migration[5.1]
  def change
    change_column :finances, :paid, :boolean, default: false
  end
end
