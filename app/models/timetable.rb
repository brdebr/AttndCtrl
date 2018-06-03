class Timetable < ApplicationRecord
  belongs_to :tool_consumer
  has_many :timetable_units
end
