require 'rails_helper'

RSpec.describe "lti_contexts/edit", type: :view do
  before(:each) do
    @lti_context = assign(:lti_context, LtiContext.create!(
      :lti_id => 1,
      :label => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit lti_context form" do
    render

    assert_select "form[action=?][method=?]", lti_context_path(@lti_context), "post" do

      assert_select "input[name=?]", "lti_context[lti_id]"

      assert_select "input[name=?]", "lti_context[label]"

      assert_select "input[name=?]", "lti_context[title]"
    end
  end
end
