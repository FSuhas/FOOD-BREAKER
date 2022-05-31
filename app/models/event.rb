class Event < ApplicationRecord
  belongs_to :user

  validates :title, :experience, :address, :description, :date, :language, :capacity, presence: true
  validates :experience, inclusion: { in: ["Dinner", "Cooking Class", "Food Tour", "Brunch"] }
  validates :language, inclusion: { in: ["French", "English", "Spanish", "Portuguese"] }

  has_many_attached :photos
end
