class AddToolConsumerToLtiContext < ActiveRecord::Migration[5.1]
  def change
    add_reference :lti_contexts, :tool_consumer, foreign_key: true
  end
end
