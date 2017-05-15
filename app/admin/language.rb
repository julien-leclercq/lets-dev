ActiveAdmin.register Language do
  menu parent: 'Languages'

  permit_params :name, :description, :documentation_url

  filter :created_at
end
