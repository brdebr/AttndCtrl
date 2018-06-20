class LtiUser < ApplicationRecord
  belongs_to :lti_role
  belongs_to :lti_context

  has_many :attendance_students
  has_many :attendances, through: :attendance_students
end
