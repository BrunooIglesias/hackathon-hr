class Project < ApplicationRecord
  belongs_to :client

  validates :title, :start_date, :work_hours, :fee, presence: true
  validates :work_hours, numericality: { greater_than_or_equal_to: 0 }
  validates :fee, numericality: { greater_than_or_equal_to: 0 }
end
