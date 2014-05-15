class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :test_runs, :project_id, :integer

    add_index :test_runs, [:project_id]
  end

  def self.down
    remove_column :test_runs, :project_id

    remove_index :test_runs, :name => :index_test_runs_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
