FactoryGirl.define do
  factory :team_user_membership do
    team
    user
    role {1}
  end
end
