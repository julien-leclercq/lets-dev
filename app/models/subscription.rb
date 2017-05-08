class Subscription < ApplicationRecord
  belongs_to :financial_movement_id
  belongs_to :user_id
end
