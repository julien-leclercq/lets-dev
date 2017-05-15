class Subscription < ApplicationRecord
  belongs_to :financial_movement
  belongs_to :user
end
