class AddMeasurementSampleTimestampToMeasurement < ActiveRecord::Migration
  def change
    remove_column :measurements, :amount
    add_column :measurements, :volume, :float
    add_column :measurements, :sampled_at, :datetime
    add_column :measurements, :temperature, :float
  end
end
