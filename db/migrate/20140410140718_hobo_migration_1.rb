class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string   :name
      t.text     :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :posts
  end
end
