class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :car_model, foreign_key: true
      t.integer :year
      t.string :status
      t.string :stage
      t.boolean :wheels
      t.boolean :chassis
      t.boolean :lasser
      t.boolean :computer
      t.boolean :engine
      t.boolean :seat
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
