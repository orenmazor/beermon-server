class RemoveBeerInformationFromKeg < ActiveRecord::Migration
  def change
    remove_column :kegs, :brewery
    remove_column :kegs, :name
    remove_column :kegs, :ibu
    remove_column :kegs, :srm

    add_column    :kegs, :beer_tap_id, :integer
    add_column    :kegs, :beer_id, :integer
  end
end
