require 'spec_helper'

describe Transaction do

  it "should have a valid factory" do
    FactoryGirl.build(:transaction).should be_valid
  end

  it "should have a client" do
    transaction = FactoryGirl.create(:transaction)
    expect(transaction.client.name).to_not be_empty
  end

  it "should have a merchant" do
    transaction = FactoryGirl.create(:transaction)
    expect(transaction.merchant.name).to_not be_empty
  end

end
