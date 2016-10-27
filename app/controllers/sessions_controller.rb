class SessionsController < ApplicationController

  # def new
  # end

  def create
    user = User.find_by(email: params[:user][:email])
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    @user = user
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root
  end

end