class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.float  :abv
      t.float  :srm
      t.float  :ibus

      t.timestamps
    end
  end
end
