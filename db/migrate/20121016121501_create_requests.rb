class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :brewery
      t.string :name
      t.string :requested_by

      t.timestamps
    end
  end
end
