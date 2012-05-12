class AddUserIdToMatchAttributes < ActiveRecord::Migration
  def change
    add_column :match_attributes, :user_id, :integer
  end
end
