class AddSuccessTransactionToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :success_transaction, :boolean
  end
end
