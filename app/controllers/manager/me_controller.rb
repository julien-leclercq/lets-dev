class Manager::MeController < Manager::BaseController
  before_action :set_current_user

  def overview
  end

  def password
  end

  def edit
  end

  def social
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to edit_manager_me_index_path, notice: 'Informations mises à jour'
    else
      redirect_to edit_manager_me_index_path, alert: @user.errors.full_messages
    end
  end

  def update_avatar
    if @user.update(user_avatar_params)
      bypass_sign_in(@user)
      redirect_to edit_manager_me_index_path, notice: 'Avatar mis à jour'
    else
      redirect_to edit_manager_me_index_path, alert: @user.errors.full_messages
    end
  end

  def update_password
    if @user.update_with_password(user_password_params)
      redirect_to password_manager_me_index_path, notice: 'Mot de passe mis à jour'
    else
      redirect_to password_manager_me_index_path, alert: @user.errors.full_messages
    end
  end

  def facebook
    @user.update(facebook_id: nil, facebook_image: nil, facebook_name: nil)
    redirect_to social_manager_me_index_path, notice: 'Facebook has been linked to your account'
  end

  def github
    @user.update(github_id: nil, github_image: nil, github_name: nil, github_username: nil)
    redirect_to social_manager_me_index_path, notice: 'Github has been linked to your account'
  end

  def google
    @user.update(google_oauth2_id: nil, google_oauth2_image: nil, google_oauth2_name: nil)
    redirect_to social_manager_me_index_path, notice: 'Google has been linked to your account'
  end

  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def user_avatar_params
    params.require(:user).permit(:avatar)
  end

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
