class SignupController < ApplicationController
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password, :avatar)
    Current.user.avatar.attach(params[:avatar])
    Current.user.avatar.attached?
  end
end

