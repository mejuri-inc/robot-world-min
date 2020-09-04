class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :stock, optional: true

  validates_presence_of :car_model_id, :year, :status

  before_save :robot_guard, unless: :new_record?
  def robot_guard
    return unless Car.computer_scan_failure(self)

    self.status = 'Scrap'
    self.stage = 'Factory_stock'
    self.stock_id = '1'
  end

  def self.computer_scan_failure(car)
    [car.chassis, car.wheels, car.lasser, car.computer, car.engine, car.seat].include?(false)
  end
end
