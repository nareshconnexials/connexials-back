class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.float :working_hours
      t.string :status
      t.string :description
      t.references :activity_log, foreign_key: true
      t.timestamps
    end
  end
end
