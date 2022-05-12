class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :street_address

      t.timestamps
    end
  end
end
