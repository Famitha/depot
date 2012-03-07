class CreatePaypals < ActiveRecord::Migration
  def change
    create_table :paypals do |t|
      t.string :card_type
      t.integer :card_no
      t.integer :card_verification
      t.string :expiry_year
      t.string :expiry_month
      t.string :fname
      t.string :lname
      t.integer :amount

      t.timestamps
    end
  end
end
