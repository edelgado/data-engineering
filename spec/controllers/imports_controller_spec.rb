require 'spec_helper'

describe ImportsController do

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      response.should be_success
    end
  end

  describe "GET 'parse'" do
    it "returns http success" do
      get 'parse'
      response.should be_success
    end
  end

end
