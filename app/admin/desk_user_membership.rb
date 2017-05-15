ActiveAdmin.register DeskUserMembership do
  menu parent: 'Desks'

  permit_params :desk_id, :user_id

  filter :created_at
end
