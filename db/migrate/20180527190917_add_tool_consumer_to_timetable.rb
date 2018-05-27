class AddToolConsumerToTimetable < ActiveRecord::Migration[5.1]
  def change
    add_reference :timetables, :tool_consumer, foreign_key: true
  end
end
