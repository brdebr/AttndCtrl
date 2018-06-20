class RemoveLtiContextFromAttendance < ActiveRecord::Migration[5.1]
  def change
    remove_reference :attendances, :lti_context, foreign_key: true
  end
end
