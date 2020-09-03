require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @factory_id = Stock.create(name: 'factory').id
    @store_id = Stock.create(name: 'store').id
    @car_model_id = CarModel.create(name: 'A', price: rand(30...60), cost: rand(1...30)).id
  end

  it 'should return true when car is created' do
    car = Car.new(
      car_model_id: @car_model_id,
      year: Time.now.year,
      status: 'Building',
      stage: 'Basic structure'
    )
    expect(car.valid?).to eq(true)
    expect(car.save).to eq(true)
  end

  it 'should return false when car_model_id: is missing' do
    car = Car.new(
      year: Time.now.year,
      status: 'Building'
    )
    expect(car.valid?).to eq(false)
    expect(car.save).to eq(false)
  end

  it 'should return false when year is missing' do
    car = Car.new(
      car_model_id: @car_model_id,
      status: 'Building',
    )
    expect(car.valid?).to eq(false)
    expect(car.save).to eq(false)
  end

  it 'should return false when status: is missing' do
    car = Car.new(
      car_model_id: @car_model_id,
      year: Time.now.year
    )
    expect(car.valid?).to eq(false)
    expect(car.save).to eq(false)
  end

  it 'should return true when car is moved to second stage' do
    car = Car.create(
      car_model_id: @car_model_id,
      year: Time.now.year,
      status: 'Building',
      stage: 'Basic structure'
    )

    expect(car.update(
             wheels: true,
             engine: true,
             chassis: true,
             stage: 'Electronic devices'
           )).to eq(true)
  end

  it 'should return true when car is moved to third stage' do
    car = Car.create(
      car_model_id: @car_model_id,
      year: Time.now.year,
      status: 'Building',
      wheels: true,
      engine: true,
      chassis: true,
      stage: 'Electronic devices'
    )

    expect(car.update(
             lasser: true,
             computer: true,
             stage: 'Final details'
           )).to eq(true)
  end

  it 'should return true when car is moved to factory stock' do
    car = Car.create(
      car_model_id: @car_model_id,
      year: Time.now.year,
      status: 'Building',
      wheels: true,
      engine: true,
      chassis: true,
      lasser: true,
      computer: true,
      stage: 'Final details'
    )

    expect(car.update(
             seat: true,
             stage: nil,
             status: 'complete',
             stock_id: @factory_id
           )).to eq(true)
  end

  it 'should return true when car is moved to store store' do
    car = Car.create(
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
    )

    expect(car.update(
             seat: true,
             stage: nil,
             status: 'complete',
             stock_id: @store_id
           )).to eq(true)
  end
end
