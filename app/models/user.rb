class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :github, :google_oauth2]

  has_many :subscriptions
  has_many :team_user_memberships
  has_many :teams, through: :team_user_memberships
  has_many :desk_user_memberships
  has_many :desks, through: :desk_user_memberships

  def self.from_omniauth(auth)
    puts auth.info
    u = where(email: auth.info.email).or(where("#{auth.provider}_id" => auth.uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user["#{auth.provider}_id"] = auth.uid
      user["#{auth.provider}_name"] = auth.info.name
      user["#{auth.provider}_image"] = auth.info.image
      user['github_username'] = auth.info.nickname if auth.provider == 'github'

      user.skip_confirmation!
    end
    u.update("#{auth.provider}_id" => auth.uid) if u["#{auth.provider}_id"].nil?
    u
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
