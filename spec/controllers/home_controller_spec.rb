require 'spec_helper'

describe HomeController do
  it "should show me the home page" do
    get :home
    response.should be_success
  end
end
