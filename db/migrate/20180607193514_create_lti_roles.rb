class CreateLtiRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :lti_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
