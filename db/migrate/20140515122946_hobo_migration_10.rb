class HoboMigration10 < ActiveRecord::Migration
  def self.up
    remove_column :tests, :test_run_id

    remove_index :tests, :name => :index_tests_on_test_run_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_column :tests, :test_run_id, :integer

    add_index :tests, [:test_run_id]
  end
end
