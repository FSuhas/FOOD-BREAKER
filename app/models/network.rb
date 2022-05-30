class Network < ApplicationRecord
  belongs_to :user
  has_many :networkers, through: :networks_user, sources: :user
end
