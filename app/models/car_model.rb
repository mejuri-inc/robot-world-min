class CarModel < ApplicationRecord
  has_many :cars
  has_many :orders

  validates_presence_of :name, :price, :cost

end
