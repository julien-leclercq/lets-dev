ActiveAdmin.register Desk do
  menu parent: 'Desks'

  permit_params :started_at, :ended_at, :current

  filter :created_at
end
