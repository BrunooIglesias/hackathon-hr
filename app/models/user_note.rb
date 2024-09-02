class UserNote < ApplicationRecord
  belongs_to :user
  belongs_to :manager, class_name: 'User'

  validates :content, presence: true
end
