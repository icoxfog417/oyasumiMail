class CreateMessageAttributes < ActiveRecord::Migration
  def change
    create_table :message_attributes do |t|

      t.timestamps
    end
  end
end
