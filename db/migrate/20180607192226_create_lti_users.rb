class CreateLtiUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :lti_users do |t|
      t.string :full_name
      t.string :given
      t.string :family
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
