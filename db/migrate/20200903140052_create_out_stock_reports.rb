class CreateOutStockReports < ActiveRecord::Migration[5.2]
  def change
    create_table :out_stock_reports do |t|
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
