class NetworksUser < ApplicationRecord
  belongs_to :user
  belongs_to :network
  has_many :events, through: :user
end
