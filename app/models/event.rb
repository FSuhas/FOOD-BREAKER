class Event < ApplicationRecord
  belongs_to :user

  EXPERIENCE = ["Dinner", "Cooking Class", "Food Tour", "Brunch"]
  LANGUAGE = ["French", "English", "Spanish", "Portuguese"]

  validates :title, :experience, :address, :description, :date, :language, :capacity, presence: true
  validates :experience, inclusion: { in: EXPERIENCE }
  validates :language, inclusion: { in: LANGUAGE }

  has_many_attached :photos
end
