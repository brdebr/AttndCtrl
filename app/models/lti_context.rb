class LtiContext < ApplicationRecord
  has_many :lti_users
  has_one :timetable
end
