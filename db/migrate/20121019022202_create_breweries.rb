class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postal_code
      t.string :province, :default => "Ontario"
      t.string :country, :default => "Canada"

      t.timestamps
    end

    add_column :beers, :brewery_id, :integer
    add_column :users, :uid, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
