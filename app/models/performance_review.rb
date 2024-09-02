class PerformanceReview < ApplicationRecord
  belongs_to :employee, class_name: 'User'
  belongs_to :manager, class_name: 'User'

  validates :title, :rate, :date, :description, presence: true
  validates :rate, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
