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
    u = where(email: auth.info.email).or(where("#{auth.provider}_id" => auth.uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user["#{auth.provider}_id"] = auth.uid
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
    u.update("#{auth.provider}_id" => auth.uid) if u["#{auth.provider}_id"].nil?
    u
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
