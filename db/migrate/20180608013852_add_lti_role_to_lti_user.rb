class AddLtiRoleToLtiUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :lti_users, :lti_role, foreign_key: true
  end
end
