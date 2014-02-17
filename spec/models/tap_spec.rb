require 'spec_helper'

describe Tap do
  subject{ create(:tap)}

  it {should be_valid}

  it "should allow setting a beer" do
    beer = create(:beer)
    subject.beer_name = beer.name
    subject.beer.should == beer
  end
end
