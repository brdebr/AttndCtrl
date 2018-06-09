class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.datetime :date
      t.references :timetable_unit, foreign_key: true
      t.references :lti_context, foreign_key: true

      t.timestamps
    end
  end
end
