class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :superior, class_name: 'User', optional: true
  has_many :subordinates, class_name: 'User', foreign_key: 'superior_id'

  validates :name, :surname, :email, :role, :birth_date, presence: true
  validates :email, uniqueness: true

  enum role: {manager: "manager", admin: "admin", reader: "reader"}

  def age
    return unless birth_date
    ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end
end
