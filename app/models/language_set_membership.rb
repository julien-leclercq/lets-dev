class LanguageSetMembership < ApplicationRecord
  belongs_to :language_id
  belongs_to :language_set_id
end
