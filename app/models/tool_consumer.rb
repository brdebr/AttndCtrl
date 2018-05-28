class ToolConsumer < ApplicationRecord
  belongs_to :admin
  has_many :timetables
end
