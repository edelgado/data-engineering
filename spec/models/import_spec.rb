require 'spec_helper'

describe Import do

  it "has a valid factory" do
    an_import = FactoryGirl.create(:import)
    an_import.should be_valid
    # Cleanup the uploaded file
    an_import.remove_file!
  end

  it "can accept a .tab file" do
    an_import = FactoryGirl.create(:import)
    an_import.file.read.should == File.open(an_import.file.path).read
  end

end
