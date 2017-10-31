class Beer < ActiveRecord::Base
  belongs_to :brewery

  validates :name, presence: true
  validates :brewery, presence:true
  validates :srm, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 42}

  def brewery_name
    brewery.try(:name)
  end

  def brewery_name=(name)
    self.brewery = Brewery.where(name: name).first
  end
end
