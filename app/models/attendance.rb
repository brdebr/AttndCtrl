class Attendance < ApplicationRecord
  belongs_to :timetable_unit
  belongs_to :lti_context

  has_many :attendance_students
  has_many :lti_users, through: :attendance_students
end
