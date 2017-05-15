ActiveAdmin.register LanguageSetMembership do
  menu parent: 'Languages'

  permit_params :language_set_id, :language_id

  filter :created_at
end
