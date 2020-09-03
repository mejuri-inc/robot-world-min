class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :stock,  optional: true

  validates_presence_of :car_model_id, :year, :status
end
