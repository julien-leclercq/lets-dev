class Language < ApplicationRecord
  has_many :language_set_memberships
  has_many :language_sets, through: :language_set_memberships
end
