require 'rails_helper'

RSpec.describe "lti_contexts/show", type: :view do
  before(:each) do
    @lti_context = assign(:lti_context, LtiContext.create!(
      :lti_id => 2,
      :label => "Label",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Title/)
  end
end
