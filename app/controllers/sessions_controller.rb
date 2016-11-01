class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.find_by(email: params[:user][:email])
    if user == nil
      redirect_to new_user_path
    elsif user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:cart] = cart
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
