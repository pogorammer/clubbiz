require 'spec_helper'

describe SearchController do

  describe "GET 'do_search'" do
    it "returns http success" do
      get 'do_search'
      response.should be_success
    end
  end

end
