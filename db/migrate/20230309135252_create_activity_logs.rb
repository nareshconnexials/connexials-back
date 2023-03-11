class CreateActivityLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_logs do |t|
      t.string :reciepents_email_addresses
      t.datetime :status_date

      t.timestamps
    end
  end
end
