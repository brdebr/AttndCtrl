class AddLtiIdToLtiUser < ActiveRecord::Migration[5.1]
  def change
    add_column :lti_users, :lti_id, :integer
  end
end
