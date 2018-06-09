class AddLtiContextToLtiUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :lti_users, :lti_context, foreign_key: true
  end
end
