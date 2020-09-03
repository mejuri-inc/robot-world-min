class OutStockReport < ApplicationRecord
  belongs_to :order,  optional: true
end
