class OutStockReport < ApplicationRecord
  belongs_to :order, optional: true

  validates_presence_of :order_id
end
