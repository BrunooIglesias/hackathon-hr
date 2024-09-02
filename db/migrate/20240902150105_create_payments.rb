class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :status
      t.date :date_paid, null: true
      t.decimal :amount

      t.timestamps
    end
  end
end
