class Attendance < ApplicationRecord
  belongs_to :timetable_unit
  belongs_to :lti_context
end
