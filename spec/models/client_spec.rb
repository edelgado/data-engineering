require 'spec_helper'
require 'pry'

describe Client do

  it "has a valid factory" do
    FactoryGirl.build(:client).should be_valid
  end

  it "should not allow more than one client with the same name" do
    FactoryGirl.create(:client, name:'Bob Costas').should be_valid
    FactoryGirl.build(:client, name:'Bob Costas').should_not be_valid
  end

  it "should have many transactions" do
    client = FactoryGirl.create(:client)
    10.times do 
      FactoryGirl.create(:transaction, client: client)  
    end
    #binding.pry
    expect(client.transactions.length).to eq(10)
  end

  it "calculates total purchases correctly" do
    an_import = FactoryGirl.create(:import)
    an_import.process_file
    nse = Client.find_by name: 'Snake Plissken'
    nse.total_purchases.should == 40.0
    another_import = FactoryGirl.create(:import)
    another_import.process_file
    nse = Client.find_by name: 'Snake Plissken'
    nse.total_purchases.should == 80.0
    nse.total_purchases(another_import.id).should == 40
  end
  
end
