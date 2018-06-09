class LtiUser < ApplicationRecord
  belongs_to :lti_role
  belongs_to :lti_context
end
