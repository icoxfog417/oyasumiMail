class CreateMatchAttributes < ActiveRecord::Migration
  def change
    create_table :match_attributes do |t|
      t.integer :sex
      t.integer :age_range
      t.string :type

      t.timestamps
    end
  end
end
