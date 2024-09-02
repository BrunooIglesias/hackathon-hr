class Client < ApplicationRecord
  validates :name, :timezone, :contact_email, presence: true
end
