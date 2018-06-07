require 'rails_helper'

RSpec.describe "lti_contexts/new", type: :view do
  before(:each) do
    assign(:lti_context, LtiContext.new(
      :lti_id => 1,
      :label => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new lti_context form" do
    render

    assert_select "form[action=?][method=?]", lti_contexts_path, "post" do

      assert_select "input[name=?]", "lti_context[lti_id]"

      assert_select "input[name=?]", "lti_context[label]"

      assert_select "input[name=?]", "lti_context[title]"
    end
  end
end
