class DeskUserMembership < ApplicationRecord
  belongs_to :desk
  belongs_to :user
end
