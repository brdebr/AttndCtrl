require 'rails_helper'

RSpec.describe "lti_users/index", type: :view do
  before(:each) do
    assign(:lti_users, [
      LtiUser.create!(
        :full_name => "Full Name",
        :given => "Given",
        :family => "Family",
        :username => "Username",
        :email => "Email"
      ),
      LtiUser.create!(
        :full_name => "Full Name",
        :given => "Given",
        :family => "Family",
        :username => "Username",
        :email => "Email"
      )
    ])
  end

  it "renders a list of lti_users" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Given".to_s, :count => 2
    assert_select "tr>td", :text => "Family".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
