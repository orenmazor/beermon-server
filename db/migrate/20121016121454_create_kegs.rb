class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.string :kind
      t.float :capacity
      t.string :brewery
      t.string :name
      t.float :ibu
      t.float :srm

      t.timestamps
    end
  end
end
