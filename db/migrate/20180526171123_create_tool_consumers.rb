class CreateToolConsumers < ActiveRecord::Migration[5.1]
  def change
    create_table :tool_consumers do |t|
      t.string :name
      t.string :key
      t.string :secret

      t.timestamps
    end
  end
end
