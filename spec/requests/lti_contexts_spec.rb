require 'rails_helper'

RSpec.describe "LtiContexts", type: :request do
  describe "GET /lti_contexts" do
    it "works! (now write some real specs)" do
      get lti_contexts_path
      expect(response).to have_http_status(200)
    end
  end
end
