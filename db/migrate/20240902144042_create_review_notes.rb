class CreateReviewNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :review_notes do |t|
      t.references :performance_review, null: false, foreign_key: true
      t.boolean :is_private, default: false, null: false
      t.text :content

      t.timestamps
    end
  end
end
