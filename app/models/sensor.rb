class Sensor < ActiveRecord::Base
  belongs_to :beer_tap, class_name: "Tap"

  VALID_TYPES = [WeightSensor]
  validates :type, inclusion: {in: VALID_TYPES.map(&:to_s)}
  validates :name, presence: true

  def self.new(options={})
    if self.class == Sensor
      options = options.with_indifferent_access
      VALID_TYPES.detect{ |sensor| sensor.to_s == options[:type]}.try(:new, options) || super
    else
      super
    end
  end

  def new_reading=(reading_value)
    raise NotImplementedError
  end
end
