class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  belongs_to :superior, class_name: 'User', optional: true
  has_many :subordinates, class_name: 'User', foreign_key: 'superior_id'

  validates :name, :surname, :email, :role, :birth_date, presence: true
  validates :email, uniqueness: true

  enum role: {manager: "manager", admin: "admin", reader: "reader", candidate: "candidate"}

  def age
    return unless birth_date
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
