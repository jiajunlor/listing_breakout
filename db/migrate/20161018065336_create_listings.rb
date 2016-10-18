class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :city

      t.timestamps null: false
    end
  end
end
