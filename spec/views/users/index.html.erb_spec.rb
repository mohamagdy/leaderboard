require 'spec_helper'

describe "users/index" do
  before(:each) do
    2.times { FactoryGirl.create(:user, name: 'David CJ', level: 1, overall: 2) }
    assign(:users, User.list)
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "David CJ", :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
