class CreateLtiContexts < ActiveRecord::Migration[5.1]
  def change
    create_table :lti_contexts do |t|
      t.integer :lti_id
      t.string :label
      t.string :title

      t.timestamps
    end
  end
end
