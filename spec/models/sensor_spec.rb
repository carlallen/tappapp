require 'spec_helper'

describe Sensor do
  subject {create(:weight_sensor)}

  it {should be_valid}

  it "should not be valid without a name" do
    subject.name = nil
    should_not be_valid
  end

end
