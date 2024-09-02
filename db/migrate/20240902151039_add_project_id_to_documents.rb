class AddProjectIdToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_reference :documents, :project, null: true, foreign_key: true
  end
end
