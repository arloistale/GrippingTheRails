class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Yay, you made it! Welcome to CornyFlakes!"
      redirect_to user
    else
      flash[:danger] = "Something went wrong :("
      redirect_to root_url
    end
  end
end
