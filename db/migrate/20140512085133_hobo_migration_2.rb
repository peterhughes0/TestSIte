class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.text     :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :projects
  end
end
