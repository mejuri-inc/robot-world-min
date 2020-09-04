require 'rails_helper'

RSpec.describe OutStockReport, type: :model do
  before(:each) do
    @factory_id = Stock.create(name: 'factory').id
    @store_id = Stock.create(name: 'store').id
    @car_model_id = CarModel.create(name: 'A', price: rand(30...60), cost: rand(1...30)).id
    @order_id = Order.create(
      success_transaction: true,
      car_model_id: @car_model_id
    ).id
  end

  it 'should return true when  stock log is created' do
    report = OutStockReport.new(
      order_id: @order_id
    )
    expect(report.valid?).to eq(true)
    expect(report.save).to eq(true)
  end

  it 'should return true when car_model_id is missing' do
    car = OutStockReport.new
    expect(car.valid?).to eq(false)
    expect(car.save).to eq(false)
  end
end
