class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :stock, optional: true

  validates_presence_of :car_model_id, :year, :status

  before_save :robot_guard, unless: :new_record?

  def robot_guard
    return unless self.computer_scan_failure

    defective_part = self.computer_defective_part
    self.status = 'Scrap'
    self.stage = 'Factory_stock'
    self.stock_id = '1'
    SlackWorker.perform("*Scrap detected*\n *carId:* #{self.id} \n *Defective part:* #{defective_part} ")
  end

  def computer_scan_failure
    [self.chassis, self.wheels, self.lasser, self.computer, self.engine, self.seat].include?(false)
  end

  def computer_defective_part
    parts = %w[chassis wheels lasser computer engine seat]
    parts_list = Hash[parts.map { |part| [part, self[part]] }]
    parts_list.key(false)
  end
end
