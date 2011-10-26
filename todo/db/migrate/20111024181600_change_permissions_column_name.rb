class ChangePermissionsColumnName < ActiveRecord::Migration
  def self.up
		rename_column :permissions, :delete, :del
  end

  def self.down
		rename_column :permissions, :del, :delete
  end
end
