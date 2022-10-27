class Event < ApplicationRecord
  belongs_to :organiser, class_name: "User",
                         foreign_key: "id"

  validates :title, :location, :description, :date, presence: true

  validates :title, length: {in: 3..30}

  validates :description, length: {minimum: 10}
end
