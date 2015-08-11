require 'spec_helper'

describe ClubAdminController do

  describe "GET 'club_edit'" do
    it "returns http success" do
      get 'club_edit'
      response.should be_success
    end
  end

  describe "GET 'club_post'" do
    it "returns http success" do
      get 'club_post'
      response.should be_success
    end
  end

end
