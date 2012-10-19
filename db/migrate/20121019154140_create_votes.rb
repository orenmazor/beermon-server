class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :beer_id
      t.integer :user_id
      t.timestamps
    end

    add_index(:votes, :beer_id)
    add_index(:votes, :user_id)
  end
end
