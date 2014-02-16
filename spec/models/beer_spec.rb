require 'spec_helper'

describe Beer do
  subject {create(:beer)}

  it {should be_valid}

  it "should not be valid without a name" do
    subject.name = nil
    should_not be_valid
  end

  it "should not be valid without a brewery" do
    subject.brewery = nil
    should_not be_valid

    subject.brewery_name = nil
    should_not be_valid
  end
end
