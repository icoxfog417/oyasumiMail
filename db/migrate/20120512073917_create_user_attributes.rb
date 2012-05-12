class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|

      t.timestamps
    end
  end
end
