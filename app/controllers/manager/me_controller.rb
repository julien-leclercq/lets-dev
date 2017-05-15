class Manager::MeController < Manager::BaseController
  before_action :set_current_user

  def show
  end

  def edit
  end

  def update
  end

  def facebook
    current_user.update(facebook_id: nil, facebook_image: nil, facebook_name: nil)
    redirect_to manager_me_index_path
  end

  def github
    current_user.update(github_id: nil, github_image: nil, github_name: nil, github_username: nil)
    redirect_to manager_me_index_path
  end

  def google
    current_user.update(google_oauth2_id: nil, google_oauth2_image: nil, google_oauth2_name: nil)
    redirect_to manager_me_index_path
  end

  private
  def set_current_user
    @user = current_user
  end
end
