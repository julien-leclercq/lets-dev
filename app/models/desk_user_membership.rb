class DeskUserMembership < ApplicationRecord
  belongs_to :desk_id
  belongs_to :user_id
end
