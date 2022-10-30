class Event < ApplicationRecord
  belongs_to :organiser, class_name: "User"

  has_many :attendees, through: :participants,
                       source: :user
  has_many :participants, dependent: :destroy

  validates :title, :location, :description, :date, presence: true
  validates :title, length: {in: 3..30}
  validates :description, length: {minimum: 10}
end
