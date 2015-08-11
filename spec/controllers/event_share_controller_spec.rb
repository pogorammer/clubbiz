require 'spec_helper'

describe EventShareController do

  describe "GET 'share'" do
    it "returns http success" do
      get 'share'
      response.should be_success
    end
  end

end
