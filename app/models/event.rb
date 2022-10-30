class Event < ApplicationRecord
  belongs_to :organiser, class_name: "User"

  has_many :participants, dependent: :destroy
  has_many :attendees, through: :participants,
                       source: :user

  validates :title, :location, :description, :date, presence: true
  validates :title, length: {in: 3..30}
  validates :description, length: {minimum: 10}

  scope :future, -> {where("date > ?", Time.now)}

  scope :past, -> {where("date < ?", Time.now)}
end
