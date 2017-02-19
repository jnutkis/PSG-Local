class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "If exists, email sent with password reset instructions"
      redirect_to login_path
    else
      flash[:success] = "If exists, email sent with password reset instructions"
      redirect_to login_path
    end
  end
  
  
  
  def edit
    
  end
end
