require 'rails_helper'

RSpec.describe "lti_users/show", type: :view do
  before(:each) do
    @lti_user = assign(:lti_user, LtiUser.create!(
      :full_name => "Full Name",
      :given => "Given",
      :family => "Family",
      :username => "Username",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Given/)
    expect(rendered).to match(/Family/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
  end
end
