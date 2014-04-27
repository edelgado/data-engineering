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

  it "calculates total sales correctly" do
    an_import = FactoryGirl.create(:import)
    an_import.process_file
    nse = Merchant.find_by name: 'Sneaker Store Emporium'
    nse.total_sales.should == 25.0
  end
  
end
