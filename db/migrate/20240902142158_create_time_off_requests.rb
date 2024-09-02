class CreateTimeOffRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :time_off_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :approved_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
