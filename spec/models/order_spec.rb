require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    @factory_id = Stock.create(name: 'factory').id
    @store_id = Stock.create(name: 'store').id
    @car_model_id = CarModel.create(name: 'A', price: rand(30...60), cost: rand(1...30)).id
    @car_id = Car.create(
      car_model_id: @car_model_id,
      year: Time.now.year,
      wheels: true,
      engine: true,
      chassis: true,
      lasser: true,
      computer: true,
      seat: true,
      stage: nil,
      status: 'complete',
      stock_id: @factory_id
    ).id
  end

  it 'should return true when order is created' do
    order = Order.new(
      car_id: @car_id,
      success_transaction: true,
      car_model_id: @car_model_id
    )
    expect(order.valid?).to eq(true)
    expect(order.save).to eq(true)
  end

  it 'should return false when car_model_id is missing' do
    order = Order.new(
      car_id: @car_id,
      success_transaction: true
    )
    expect(order.valid?).to eq(false)
    expect(order.save).to eq(false)
  end

  it 'should return false when success_transaction is missing' do
    order = Order.new(
      car_id: @car_id,
      car_model_id: @car_model_id
    )
    expect(order.valid?).to eq(false)
    expect(order.save).to eq(false)
  end
end
