class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :Address
      t.string :Zip_code
      t.timestamps
    end
  end
end


