class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.integer :cost
      t.integer :price

      t.timestamps
    end
  end
end
