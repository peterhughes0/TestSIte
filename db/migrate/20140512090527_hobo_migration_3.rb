class HoboMigration3 < ActiveRecord::Migration
  def self.up
    drop_table :posts

    create_table :tests do |t|
      t.string   :name
      t.text     :description
      t.text     :prerequisites
      t.text     :steps
      t.text     :input
      t.text     :expected_result
      t.text     :actual_result
      t.boolean  :status
      t.text     :comments
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :test_groups do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    create_table "posts", force: true do |t|
      t.string   "name"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    drop_table :tests
    drop_table :test_groups
  end
end
