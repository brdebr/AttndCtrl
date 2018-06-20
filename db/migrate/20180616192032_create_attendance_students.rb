class CreateAttendanceStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_students do |t|
      t.string :state
      t.string :notes
      t.references :lti_user, foreign_key: true
      t.references :attendance, foreign_key: true

      t.timestamps
    end
  end
end
