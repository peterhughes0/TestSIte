class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :tests, :test_run_id, :integer

    add_index :tests, [:test_run_id]
  end

  def self.down
    remove_column :tests, :test_run_id

    remove_index :tests, :name => :index_tests_on_test_run_id rescue ActiveRecord::StatementInvalid
  end
end
