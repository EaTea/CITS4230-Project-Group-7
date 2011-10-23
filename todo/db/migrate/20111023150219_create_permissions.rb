class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.boolean :add
      t.boolean :edit
      t.boolean :delete
      t.boolean :own
      t.integer :user_id
      t.integer :list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
