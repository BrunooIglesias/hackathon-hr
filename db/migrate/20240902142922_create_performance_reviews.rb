class CreatePerformanceReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :performance_reviews do |t|
      t.references :employee, null: false, foreign_key: { to_table: :users }
      t.references :manager, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.integer :rate, null: false
      t.date :date, null: false
      t.text :description

      t.timestamps
    end
  end
end
