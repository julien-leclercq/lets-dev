class LanguageSet < ApplicationRecord
  has_many :language_set_memberships
  has_many :languages, through: :language_set_memberships
end
