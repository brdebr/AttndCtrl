class AddLtiContextToTimetable < ActiveRecord::Migration[5.1]
  def change
    add_reference :timetables, :lti_context, foreign_key: true
  end
end
