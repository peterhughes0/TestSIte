class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :test_groups, :project_id, :integer

    add_index :test_groups, [:project_id]
  end

  def self.down
    remove_column :test_groups, :project_id

    remove_index :test_groups, :name => :index_test_groups_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
