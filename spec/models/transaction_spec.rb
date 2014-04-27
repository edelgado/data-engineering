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

  it "calculates total gross revenue correctly" do
    an_import = FactoryGirl.create(:import)
    an_import.process_file
    Transaction.total_gross_revenue.should == 95.0
    another_import = FactoryGirl.create(:import)
    another_import.process_file
    Transaction.total_gross_revenue.should == 190.0
    Transaction.total_gross_revenue(another_import.id).should == 95.0
  end

end
