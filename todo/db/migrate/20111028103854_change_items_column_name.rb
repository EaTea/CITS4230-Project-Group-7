class ChangeItemsColumnName < ActiveRecord::Migration
  def self.up
		rename_column :items, :date, :due_date
  end

  def self.down
		rename_column :items, :due_date, :date
  end
end
