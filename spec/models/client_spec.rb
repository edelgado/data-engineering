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
  
end
