require 'spec_helper'

describe Brewery do


  context "factory" do
    subject{ create(:brewery)}

    it {should be_valid}

    it "should not be inalid wiithout a name" do
      subject.name = nil
      subject.should_not be_valid
    end

    it "should not be valid without a location" do
      subject.location = nil
      subject.should_not be_valid
    end
  end
end
