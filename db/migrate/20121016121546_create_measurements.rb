class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :keg_id
      t.float :amount

      t.timestamps
    end
  end
end
