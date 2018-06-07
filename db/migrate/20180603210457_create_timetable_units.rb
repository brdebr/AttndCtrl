class CreateTimetableUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :timetable_units do |t|
      t.string :name
      t.text :description
      t.integer :week_day
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
