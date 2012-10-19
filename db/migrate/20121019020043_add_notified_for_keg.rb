class AddNotifiedForKeg < ActiveRecord::Migration
  def change
    add_column :kegs, :notified, :boolean, :default => false
  end
end
