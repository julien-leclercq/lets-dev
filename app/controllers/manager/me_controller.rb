class Manager::MeController < Manager::BaseController
  before_action :set_current_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to manager_me_index_path, notice: 'User updated successfully'
    else
      redirect_to manager_me_index_path, alert: @user.errors.full_messages
    end
  end

  def facebook
    @user.update(facebook_id: nil, facebook_image: nil, facebook_name: nil)
    redirect_to manager_me_index_path, notice: 'Facebook has been linked to your account'
  end

  def github
    @user.update(github_id: nil, github_image: nil, github_name: nil, github_username: nil)
    redirect_to manager_me_index_path, notice: 'Github has been linked to your account'
  end

  def google
    @user.update(google_oauth2_id: nil, google_oauth2_image: nil, google_oauth2_name: nil)
    redirect_to manager_me_index_path, notice: 'Google has been linked to your account'
  end

  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
