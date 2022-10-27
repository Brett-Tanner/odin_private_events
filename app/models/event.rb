class Event < ApplicationRecord
  validates :title, :location, :description, :date, presence: true

  validates :title, length: {in: 3..30}

  validates :description, length: {minimum: 10}
end
