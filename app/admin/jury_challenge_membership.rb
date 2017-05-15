ActiveAdmin.register JuryChallengeMembership do
  menu parent: 'Challenges'

  permit_params :user_id, :challenge_id

  filter :created_at
end
