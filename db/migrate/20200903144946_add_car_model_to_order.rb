class AddCarModelToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :car_model, foreign_key: true
  end
end
