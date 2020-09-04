class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :stock, optional: true

  validates_presence_of :car_model_id, :year, :status

  before_save :robot_guard, unless: :new_record?
  def robot_guard
    return unless Car.computer_scan_failure(self)
    defective_part = Car.computer_defective_part(self)
    self.status = 'Scrap'
    self.stage = 'Factory_stock'
    self.stock_id = '1'
    SlackWorker::perform("*Scrap detected*\n *carId:* #{self.id} \n *Defective part:* #{defective_part} ")
  end

  def self.computer_scan_failure(car)
    [car.chassis, car.wheels, car.lasser, car.computer, car.engine, car.seat].include?(false)
  end

  def self.computer_defective_part(car)
    parts = %w[chassis wheels lasser computer engine seat]
    car = Hash[parts.map {|part| [part, [true, false].sample]}]
    parts_list = Hash[parts.map {|part| [part, car[part]]}]
    parts_list.key(false)
  end
end
