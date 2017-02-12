class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      if admin? || super?
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      flash.now[:danger] = "Invalid Username and Password"
      render 'new'
    end
  
  end
  
  def destroy
    
  end
  
end
