require 'rails_helper'

RSpec.describe "lti_users/new", type: :view do
  before(:each) do
    assign(:lti_user, LtiUser.new(
      :full_name => "MyString",
      :given => "MyString",
      :family => "MyString",
      :username => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new lti_user form" do
    render

    assert_select "form[action=?][method=?]", lti_users_path, "post" do

      assert_select "input[name=?]", "lti_user[full_name]"

      assert_select "input[name=?]", "lti_user[given]"

      assert_select "input[name=?]", "lti_user[family]"

      assert_select "input[name=?]", "lti_user[username]"

      assert_select "input[name=?]", "lti_user[email]"
    end
  end
end
