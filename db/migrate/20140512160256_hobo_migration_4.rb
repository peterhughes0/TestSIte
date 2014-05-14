class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :tests, :project_id, :integer
    add_column :tests, :test_group_id, :integer

    add_index :tests, [:project_id]
    add_index :tests, [:test_group_id]
  end

  def self.down
    remove_column :tests, :project_id
    remove_column :tests, :test_group_id

    remove_index :tests, :name => :index_tests_on_project_id rescue ActiveRecord::StatementInvalid
    remove_index :tests, :name => :index_tests_on_test_group_id rescue ActiveRecord::StatementInvalid
  end
end
