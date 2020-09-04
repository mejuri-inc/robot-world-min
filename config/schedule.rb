set :environment, "development"

every 1.minutes do
  rake "robot_builder_new_cars"
end

every 1.minutes do
  rake "robot_builder_move_to_electronic_devices"
end

every 2.minutes do
  rake "robot_builder_move_to_final_details"
end

every 2.minutes do
  rake "robot_builder_move_to_factory_stock"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end


