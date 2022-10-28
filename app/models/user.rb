class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, inverse_of: "organiser", 
                    foreign_key: "organiser_id",
                    dependent: :destroy

  has_many :participants, dependent: :destroy      

  has_many :attended_events, through: :participants,
                             source: :event

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {in: 2..20}
  validates :name, format: {with: /[a-zA-Z0-9]+/}
end
