class RenameBreweryColumn < ActiveRecord::Migration
  def change
    rename_column :beers, :brewery_id, :manufacturer_id
    rename_table :breweries, :manufacturers
  end
end
