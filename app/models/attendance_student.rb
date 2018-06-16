class AttendanceStudent < ApplicationRecord
  belongs_to :lti_user
  belongs_to :attendance
end
