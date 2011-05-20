require 'spec_helper'

describe PagesController do
  describe "GET 'show'" do
    it "should 404 on a page that does not exists" do
      get :show, :title => 'this_page_does_not_exist'
      response.status.should eql(404)
    end
  end
end