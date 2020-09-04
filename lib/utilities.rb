class Utilities
  def self.random_part(parts)
    parts.sample
  end

  def self.random_probability(prob)
    rand(1..100) % prob.zero?
  end

  def self.cars_in_stage(stage)
    Car.where(stage: stage).select('cars.id')
  end
end
