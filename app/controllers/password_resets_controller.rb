class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "If the email existed, password reset instructions were sent"
      redirect_to login_path
    else
      flash[:success] = "If the email existed, password reset instructions were sent"
      redirect_to login_path
    end
  end
  
  
  
  def edit
    
  end
  
  def profile_reset
    if super?
      @user = User.find(params[:id])
      if @user
        @user.create_reset_digest
        @user.send_password_reset_email
        flash[:success] = "Password reset instructions were sent"
        render 'users/edit'
      else
        flash[:error] = "An error has occurred"
        render 'users/edit'
      end
    elsif admin?
      @user =  User.find(params[:id])
      if @user
        if @user.vendor_id == current_user.vendor_id && @user != current_user
          @user.create_reset_digest
          @user.send_password_reset_email
          flash[:success] = "Password reset instructions were sent"
          render 'users/edit'
        else 
          flash[:error] = "An error has occurred"
          render 'users/edit'
        end
      end
    else
    redirect_to root_path
    end
  end
  
  
end
