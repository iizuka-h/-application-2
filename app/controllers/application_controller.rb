class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!,except: :index

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  def after_sign_up_path_for(resource)
    user_path(resource)
  end


  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:id])
  # end
   

  


end

