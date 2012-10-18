class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :beer_id
      t.integer :value
      t.string :message

      t.timestamps
    end
  end
end
