class Suggestion < ApplicationRecord
  validates :title, :description, :date, presence: true
end
