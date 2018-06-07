require 'rails_helper'

RSpec.describe "LtiUsers", type: :request do
  describe "GET /lti_users" do
    it "works! (now write some real specs)" do
      get lti_users_path
      expect(response).to have_http_status(200)
    end
  end
end
