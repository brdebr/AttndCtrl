class RemoveLtiContextFromTimetable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :timetables, :lti_context, foreign_key: true
  end
end
