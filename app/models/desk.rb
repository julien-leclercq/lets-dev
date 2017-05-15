class Desk < ApplicationRecord
  has_many :desk_user_memberships
  has_many :users, through: :desk_user_memberships

  before_save :set_current

  private
  def set_current
    self.current = Time.now >= self.started_at && Time.now <= self.ended_at
  end
end
