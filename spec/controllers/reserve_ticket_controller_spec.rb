require 'spec_helper'

describe ReserveTicketController do

  describe "GET 'reserve'" do
    it "returns http success" do
      get 'reserve'
      response.should be_success
    end
  end

end
