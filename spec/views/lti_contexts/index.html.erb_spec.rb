require 'rails_helper'

RSpec.describe "lti_contexts/index", type: :view do
  before(:each) do
    assign(:lti_contexts, [
      LtiContext.create!(
        :lti_id => 2,
        :label => "Label",
        :title => "Title"
      ),
      LtiContext.create!(
        :lti_id => 2,
        :label => "Label",
        :title => "Title"
      )
    ])
  end

  it "renders a list of lti_contexts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
