class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.integer :user_id
      t.integer :allowance_id
      t.integer :deduction_id
      t.string :designation
      t.string :department
      t.datetime :date_of_joining
      t.string :project_location

      t.timestamps
    end
  end
end
