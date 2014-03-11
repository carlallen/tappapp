# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sensor do
    name "Postal Scale"
    type "WeightSensor"
    reading 1
  end

  factory :weight_sensor do
    name "Force Sensor"
    type "WeightSensor"
    reading 0
  end
end
