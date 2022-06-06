class Network < ApplicationRecord
  belongs_to :user
  has_many :networks_users
  has_many :networkers, through: :networks_user, source: :user
end
