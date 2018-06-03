class AddTimetableToTimetableUnit < ActiveRecord::Migration[5.1]
  def change
    add_reference :timetable_units, :timetable, foreign_key: true
  end
end
