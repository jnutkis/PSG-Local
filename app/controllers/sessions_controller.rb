class SessionsController < ApplicationController
  def new 
    if logged_in? && (admin? || super?) #if logged_in and user is admin or superuser go to admin page
      redirect_to administration_path
    elsif logged_in? #if logged in go to homepage
      redirect_to root_path
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password]) 
      if user.active == 1
        log_in user
        if admin? || super?
          redirect_to administration_path
        else
          redirect_to root_path
        end
      else
      flash.now[:danger] = "User is inactive"
      render 'new'
      end
    else
      flash.now[:danger] = "Invalid Username and Password"
      render 'new'
    end
  
  end
  
  def destroy
    if logged_in?
      logout 
      redirect_to root_path
    end
  end
  
end
