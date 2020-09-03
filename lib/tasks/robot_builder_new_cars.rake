desc 'Create new ammount of random Cars and start in Basic structure line'
task :robot_builder_new_cars  => :environment do

  rand(1...10).times do
    Car.create(
      car_model_id: rand(1...10),
      year: Time.now.year,
      status: 'Building',
      stage: 'Basic_structure'
    )
  end
end