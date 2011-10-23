class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.date :date
      t.boolean :completed
      t.integer :list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
