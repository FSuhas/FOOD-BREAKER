class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :chatrooms

  EXPERIENCE = ["Dinner", "Cooking Class", "Food Tour", "Brunch"]
  LANGUAGE = ["French", "English", "Spanish", "Portuguese"]

  validates :title, :experience, :address, :description, :date, :language, :capacity, presence: true
  validates :experience, inclusion: { in: EXPERIENCE }
  validates :language, inclusion: { in: LANGUAGE }

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def show
    @user = current_user
  end

  def calcul_capacity_book
    capacity - bookings.where(confirmation: true).sum(&:nb_guest)
  end

  def calcul_capacity
    capacity - bookings.sum(&:nb_guest)
  end
end
