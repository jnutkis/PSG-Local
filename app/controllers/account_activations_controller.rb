class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && user.active != 1 && user.authenticated?(:activation, params[:id])
      user.activate
      logout
      flash[:success] = "Account activated! Log-in with the email contained in your activation email"
      redirect_to login_path
    else
      flash[:danger] = "Invalid activation link"
      redirect_to login_path
    end
  end
  
end
  
