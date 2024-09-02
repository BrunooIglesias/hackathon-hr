class CreateUserNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :user_notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :manager, null: false, foreign_key: { to_table: :users }
      t.text :content, null: false

      t.timestamps
    end
  end
end
