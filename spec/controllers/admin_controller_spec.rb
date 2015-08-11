require 'spec_helper'

describe AdminController do

  describe "GET 'validate_club'" do
    it "returns http success" do
      get 'validate_club'
      response.should be_success
    end
  end

end
