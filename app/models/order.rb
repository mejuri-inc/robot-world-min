class Order < ApplicationRecord
  belongs_to :car, optional: true
  belongs_to :car_model

  validates_presence_of :success_transaction, :car_model_id
end
