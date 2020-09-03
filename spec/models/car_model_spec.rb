require 'rails_helper'

RSpec.describe CarModel, type: :model do
  it 'should return true if car model is saved with all the field completed' do
    car_model = CarModel.new(
      name: 'Model A',
      price: '223',
      cost: '123'
    )
    expect(car_model.valid?).to eq(true)
    expect(car_model.save).to eq(true)
  end

  it 'should return false if car model is not saved when name is missing' do
    car_model = CarModel.new(
      price: '223',
      cost: '123'
    )
    expect(car_model.valid?).to eq(false)
    expect(car_model.save).to eq(false)
  end

  it 'should return false if car model is not saved when price is missing' do
    car_model = CarModel.new(
      name: 'Model A',
      cost: '123'
    )
    expect(car_model.valid?).to eq(false)
    expect(car_model.save).to eq(false)
  end

  it 'should return false if car model is not saved when cost is missing' do
    car_model = CarModel.new(
      name: 'Model A',
      price: '123'
    )
    expect(car_model.valid?).to eq(false)
    expect(car_model.save).to eq(false)
  end
end
