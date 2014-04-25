require 'spec_helper'

describe Merchant do

  it "should have a valid factory" do
    FactoryGirl.build(:merchant).should be_valid
  end

  it "should not allow more than one merchant with the same name" do
    FactoryGirl.create(:merchant, name:'Acme Co.').should be_valid
    FactoryGirl.build(:merchant, name:'Acme Co.').should_not be_valid
  end

  it "should have many transactions" do
    merchant = FactoryGirl.create(:merchant)
    10.times do 
      FactoryGirl.create(:transaction, merchant: merchant)  
    end
    #binding.pry
    expect(merchant.transactions.length).to eq(10)
  end
  
end
