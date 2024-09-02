class ReviewNote < ApplicationRecord
  belongs_to :performance_review

  validates :content, presence: true
end
