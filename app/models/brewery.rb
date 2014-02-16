class Brewery < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :beers
end
