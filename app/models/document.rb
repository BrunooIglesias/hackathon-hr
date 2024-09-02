class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  belongs_to :project, optional: true

  validates :filename, presence: true
end
