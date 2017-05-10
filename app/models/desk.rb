class Desk < ApplicationRecord
  has_many :desk_user_memberships
  has_many :users, through: :desk_user_memberships
end
