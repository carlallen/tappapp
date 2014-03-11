class WeightSensor < Sensor
  def percent_remaining
    if full.to_i - empty.to_i > 0
      ((reading.to_i-empty.to_i)/(full.to_i - empty.to_i).to_f * 100).to_i
    else
      0
    end
  end
end