class CreateBankDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_details do |t|
      t.integer :employment_id
      t.string :bank_ac_no
      t.string :bank_name
      t.string :ifsc_code
      t.string :pan_no
      t.string :uan_no

      t.timestamps
    end
  end
end
