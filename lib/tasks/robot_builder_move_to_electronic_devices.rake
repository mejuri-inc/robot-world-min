desc 'move cars to electronic devices line'
task :robot_builder_move_to_electronic_devices  => :environment do

  cars_stage_1 = Car.where(stage: 'Basic_structure').select('cars.id')

  cars_stage_1.each do |car_data|

    actual_car = Car.find(car_data.id)

    fail_probability = rand(1..100) % 33 == 0
    fail_part = %w(wheels engine chassis).sample

    actual_car.update(
      wheels: ((fail_probability and fail_part == 'wheels') ? false : true ),
      engine: ((fail_probability and fail_part == 'engine') ? false : true ),
      chassis: ((fail_probability and fail_part == 'chassis') ? false : true ),
      stage: 'Electronic_devices')

    end
end