desc 'move cars to factory stok'
task :robot_builder_move_to_factory_stock  => :environment do

  cars_stage_1 = Car.where(stage: 'Final_details').select('cars.id')

  cars_stage_1.each do |car_data|

  actual_car = Car.find(car_data.id)

  fail_probability = rand(1..100) % 68 == 0

  actual_car.update(
    seat: (fail_probability ? false : true ),
    stage: 'Factory_stock',
    status: 'Complete',
    stock_id: 1)
  end
end