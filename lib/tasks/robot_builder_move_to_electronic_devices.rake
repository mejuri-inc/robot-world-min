desc 'move cars to electronic devices line'
task :robot_builder_move_to_electronic_devices  => :environment do

  cars_stage_1 = Car.where(stage: 'Basic_structure').select('cars.id')

  cars_stage_1.each do |car_data|

  actual_car = Car.find(car_data.id)

  actual_car.update(
    wheels: true,
    engine: true,
    chassis: true,
    stage: 'Electronic devices')
  end
end