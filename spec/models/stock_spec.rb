require 'rails_helper'

RSpec.describe Stock, type: :model do
  it 'should return true when stock  is created' do
    stock = Stock.new(name: 'Factory')
    expect(stock.valid?).to eq(true)
    expect(stock.save).to eq(true)
  end

  it 'should return false when name is missin' do
    stock = Stock.new
    expect(stock.valid?).to eq(false)
    expect(stock.save).to eq(false)
  end
end
