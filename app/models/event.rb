class Event < ApplicationRecord
  belongs_to :user

  validates :title, :type, :address, :description, :date, :language, :capacity, presence: true
  validates :type, inclusion: { in: ["Dinner", "Cooking Class", "Food Tour", "Brunch"] }
  validates :language, inclusion: { in: ["French", "English", "Spanish", "Portuguese"] }
end
