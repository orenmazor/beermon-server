class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.boolean :send_sms
      t.boolean :send_email

      t.timestamps
    end
  end
end
