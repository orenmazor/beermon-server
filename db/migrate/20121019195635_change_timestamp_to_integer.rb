class ChangeTimestampToInteger < ActiveRecord::Migration
  def change
    remove_column :measurements, :sampled_at
    add_column :measurements, :sampled_at, :integer, :limit => 8
  end
end
