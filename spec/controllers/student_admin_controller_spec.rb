require 'spec_helper'

describe StudentAdminController do

  describe "GET 'student_login'" do
    it "returns http success" do
      get 'student_login'
      response.should be_success
    end
  end

  describe "GET 'student_edit'" do
    it "returns http success" do
      get 'student_edit'
      response.should be_success
    end
  end

end
