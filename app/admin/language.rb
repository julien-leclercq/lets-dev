ActiveAdmin.register Language do
  menu parent: 'Languages'

  permit_params :name, :description, :documentation_url, :logo

  filter :created_at

  form do |f|
    f.inputs "Project Details" do
      f.input :name
      f.input :description
      f.input :documentation_url
      f.input :logo, as: :file, required: false
    end
    f.actions
  end
end
