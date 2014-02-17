class Tap < ActiveRecord::Base
  belongs_to :beer
  default_scope -> { order("id ASC")}

  def beer_name
    beer.try(:name)
  end

  def beer_name=(name)
    self.beer = Beer.where(name: name).first
  end
end
