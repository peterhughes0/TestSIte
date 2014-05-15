class HoboMigration11 < ActiveRecord::Migration
  def self.up
    add_column :results, :state, :string, :default => "untested"
    add_column :results, :key_timestamp, :datetime

    add_index :results, [:state]
  end

  def self.down
    remove_column :results, :state
    remove_column :results, :key_timestamp

    remove_index :results, :name => :index_results_on_state rescue ActiveRecord::StatementInvalid
  end
end
