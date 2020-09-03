desc 'move cars to final details line'
task :robot_builder_move_to_final_details  => :environment do

  cars_stage_1 = Car.where(stage: 'Electronic_devices').select('cars.id')

  cars_stage_1.each do |car_data|

  actual_car = Car.find(car_data.id)

  actual_car.update(
    lasser: true,
    computer: true,
    stage: 'Final_details')
  end
end