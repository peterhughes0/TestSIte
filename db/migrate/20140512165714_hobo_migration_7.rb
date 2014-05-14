class HoboMigration7 < ActiveRecord::Migration
  def self.up
    create_table :test_runs do |t|
      t.string   :release_number
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :test_runs
  end
end
