class AddAdminToToolConsumer < ActiveRecord::Migration[5.1]
  def change
    add_reference :tool_consumers, :admin, foreign_key: true
  end
end
