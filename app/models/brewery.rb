class Brewery < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
end
