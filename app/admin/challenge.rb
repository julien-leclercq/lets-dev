ActiveAdmin.register Challenge do
  menu parent: 'Challenges'

  permit_params :language_set_id, :title, :subject, :starts_at, :ends_at

  filter :created_at
end
