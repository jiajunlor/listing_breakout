class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :user_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
