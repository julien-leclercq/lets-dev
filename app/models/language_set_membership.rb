class LanguageSetMembership < ApplicationRecord
  belongs_to :language
  belongs_to :language_set
end
