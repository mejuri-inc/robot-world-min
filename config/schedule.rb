set :environment, "development"
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 10.minutes do
#   rake "some:great:rake:task"
# end

every 10.minutes do
  rake "robot_builder_new_cars"
end

every 3.minutes do
  rake "robot_builder_move_to_electronic_devices"
end

every 6.minutes do
  rake "robot_builder_move_to_final_details"
end

every 9.minutes do
  rake "robot_builder_move_to_factory_stock"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
