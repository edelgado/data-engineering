require 'spec_helper'

describe Import do

  it "has a valid factory" do
    FactoryGirl.create(:import).should be_valid
  end

  it "can accept a .tab file" do
    an_import = FactoryGirl.create(:import)
    an_import.file.read.should == File.open(an_import.file.path).read
  end

end
