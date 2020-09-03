class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :stock,  optional: true
end
