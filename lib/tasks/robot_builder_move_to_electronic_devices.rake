desc 'move cars to electronic devices line'
task robot_builder_move_to_electronic_devices: :environment do
  
    Utilities.cars_in_stage('Basic_structure').each do |car_data|
    actual_car = Car.find(car_data.id)

    fail_probability = Utilities.random_probability(33)
    fail_part = Utilities.random_part(%w[wheels engine chassis])

    actual_car.update(
      wheels: !(fail_probability and fail_part == 'wheels'),
      engine: !(fail_probability and fail_part == 'engine'),
      chassis: !(fail_probability and fail_part == 'chassis'),
      stage: 'Electronic_devices'
    )
  end
end
