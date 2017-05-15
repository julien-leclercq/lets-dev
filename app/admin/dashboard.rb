ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do

    columns do
      column do
        panel 'Recent challenges' do
          ul do
            Challenge.last(5).map do |c|
              li link_to(c.title, admin_challenge_path(c))
            end
          end
        end
      end

      column do
        panel 'Info' do
          para 'Welcome to ActiveAdmin.'
        end
      end
    end
  end
end
