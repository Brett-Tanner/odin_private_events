class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attended_events, through: :participants,
                                      source: :event
  has_many :events, foreign_key: "organiser_id"
  has_many :participants, dependent: :destroy      


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {in: 2..20}
  validates :name, format: {with: /[a-zA-Z0-9]+/}
end
