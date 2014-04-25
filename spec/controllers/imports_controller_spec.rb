require 'spec_helper'

describe ImportsController do

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      response.should be_success
    end
  end

  describe "POST 'parse'" do
    it "returns http success" do
      post 'parse'
      response.should be_success
    end
  end

end
