class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :domain
      t.datetime :start_date
      t.bigint :rate
      t.string :currency
      t.string :project_type

      t.timestamps
    end
  end
end
