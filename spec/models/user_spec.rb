require 'spec_helper'

describe User do
  it "should specify some sortable columns" do
    User.sortable_columns.should_not be_empty
  end
  
  it "should provide a query interface" do
    User.should respond_to(:query)
  end
end
