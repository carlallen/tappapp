class Beer < ActiveRecord::Base
  belongs_to :brewery

  validates :name, presence: true
  validates :brewery, presence:true

  def brewery_name
    brewery.try(:name)
  end

  def brewery_name=(name)
    self.brewery = Brewery.where(name: name).first
  end
end
