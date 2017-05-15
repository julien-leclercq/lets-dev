ActiveAdmin.register LanguageSet do
  menu parent: 'Languages'

  permit_params :name

  filter :created_at
end
