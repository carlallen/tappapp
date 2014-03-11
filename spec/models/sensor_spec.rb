require 'spec_helper'

describe Sensor do
  subject {create(:weight_sensor)}

  it {should be_valid}

  it "should not be valid without a name" do
    subject.name = nil
    should_not be_valid
  end

  it "should calculate remaining volume remaining" do
    subject.full = 110
    subject.empty = 10
    subject.reading = 60
    subject.percent_remaining.should == 50
  end

end
