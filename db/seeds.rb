('A'..'J').each do |model|
  CarModel.create(name: model, price: rand(30...60), cost: rand(1...30))
end

Stock.create(name: 'factory')
Stock.create(name: 'store')

  