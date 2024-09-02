class Payment < ApplicationRecord
  belongs_to :client
  has_one_attached :file

  enum status: { pending: 0, paid: 1 }

  validates :status, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
