class Timetable < ApplicationRecord
  belongs_to :tool_consumer
  has_many :timetable_units, dependent: :delete_all

  accepts_nested_attributes_for :timetable_units, allow_destroy: true, reject_if: lambda { |attr| attr['name'].blank?}
end
