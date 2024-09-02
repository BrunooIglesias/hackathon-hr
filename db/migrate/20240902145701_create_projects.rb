class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :client, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :work_hours
      t.decimal :fee

      t.timestamps
    end
  end
end
