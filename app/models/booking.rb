class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :nb_guest, numericality: { greater_than: 0 }
  validate :check_event_capacity

  def check_event_capacity
    if self.nb_guest > self.event.calcul_capacity
      errors.add(:nb_guest, "Number of guests reached")
    end
  end
end
