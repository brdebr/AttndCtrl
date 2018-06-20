class ToolConsumer < ApplicationRecord
  belongs_to :admin
  has_many :lti_contexts
  has_many :timetables, dependent: :delete_all
  accepts_nested_attributes_for :timetables, allow_destroy: true, reject_if: lambda { |attr| attr['name'].blank?}
end
