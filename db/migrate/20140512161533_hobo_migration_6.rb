class HoboMigration6 < ActiveRecord::Migration
  def self.up
    remove_column :projects, :body
  end

  def self.down
    add_column :projects, :body, :text
  end
end
