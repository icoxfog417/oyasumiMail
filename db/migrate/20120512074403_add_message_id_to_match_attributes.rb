class AddMessageIdToMatchAttributes < ActiveRecord::Migration
  def change
    add_column :match_attributes, :message_id, :integer
  end
end
