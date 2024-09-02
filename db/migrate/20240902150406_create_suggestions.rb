class CreateSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
