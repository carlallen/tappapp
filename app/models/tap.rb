class Tap < ActiveRecord::Base
  belongs_to :beer
  has_one :sensor
  default_scope -> { order("id ASC")}

  delegate :brewery_name, to: :beer, allow_nil: true

  def beer_name
    beer.try(:name)
  end

  def beer_name=(name)
    self.beer = Beer.where(name: name).first
  end

  def sensor_id
    sensor.try(:id)
  end

  def sensor_id=(sensor_id)
    self.sensor = Sensor.where(id: sensor_id).first
  end

end
