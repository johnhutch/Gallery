ActiveAdmin.register Post do
  index do
    column :title
    column :created_at
    column :updated_at
    default_actions
  end
end
