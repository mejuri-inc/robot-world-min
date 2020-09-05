desc 'move cars to store stok'
task robot_guard_move_to_store_stock: :environment do
  Car.where(
    stock_id: 1,
    status:"Complete")
    .select('cars.id')
    .each do |car_data|

      actual_car = Car.find(car_data.id)

      fail_probability = Utilities.random_probability(25)

      actual_car.update(
        stage: 'Store_stock',
        stock_id: 2
      )
  end
end
