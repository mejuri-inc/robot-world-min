desc 'move cars to final details line'
task :robot_builder_move_to_final_details  => :environment do

  cars_stage_1 = Car.where(stage: 'Electronic_devices').select('cars.id')

  cars_stage_1.each do |car_data|

  actual_car = Car.find(car_data.id)

  fail_probability = rand(1..100) % 20 == 0
  fail_part = %w(lasser computer).sample

  actual_car.update(
    lasser: ((fail_probability and fail_part == 'lasser') ? false : true ),
    computer: ((fail_probability and fail_part == 'computer') ? false : true ),
    stage: 'Final_details')
  end
end