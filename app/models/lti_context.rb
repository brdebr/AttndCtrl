class LtiContext < ApplicationRecord
  has_many :lti_users
  has_many :timetables
  belongs_to :tool_consumer
end
