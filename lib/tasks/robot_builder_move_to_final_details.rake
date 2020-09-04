desc 'move cars to final details line'
task robot_builder_move_to_final_details: :environment do
  Utilities.cars_in_stage('Electronic_devices').each do |car_data|
    actual_car = Car.find(car_data.id)

    fail_probability = Utilities.random_probability(20)
    fail_part = Utilities.random_part(%w[lasser computer])

    actual_car.update(
      lasser: !(fail_probability and fail_part == 'lasser'),
      computer: !(fail_probability and fail_part == 'computer'),
      stage: 'Final_details'
    )
  end
end
