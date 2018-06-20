class Attendance < ApplicationRecord
  belongs_to :timetable_unit

  has_many :attendance_students, dependent: :delete_all
  has_many :lti_users, through: :attendance_students
end
