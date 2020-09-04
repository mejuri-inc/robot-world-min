desc 'move cars to factory stok'
task robot_builder_move_to_factory_stock: :environment do
  Utilities.cars_in_stage('Final_details').each do |car_data|
    actual_car = Car.find(car_data.id)

    fail_probability = Utilities.random_probability(25)

    actual_car.update(
      seat: !fail_probability,
      stage: 'Factory_stock',
      status: 'Complete',
      stock_id: 1
    )
  end
end
