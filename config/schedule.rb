set :environment, "development"

every 1.minutes do
  rake "robot_builder_new_cars"
end

every 2.minutes do
  rake "robot_builder_move_to_electronic_devices"
end

every 3.minutes do
  rake "robot_builder_move_to_final_details"
end

every 4.minutes do
  rake "robot_builder_move_to_factory_stock"
end

every 5.minutes do
  rake "robot_guard_move_to_store_stock"
end



