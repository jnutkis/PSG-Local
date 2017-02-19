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

  if user #if user exists
    if user.locked_out? #if user password time limit is in place
    
    if user && user.authenticate(params[:session][:password]) #if exists and password matched up
      
          if user.active == 1 #if user active
            log_in user
            user.update_attribute(:password_fails, 0)
            
            
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
      user.increment!(:password_fails)
        if user.password_fails == 5
          user.update_attribute(:locked_at, Time.zone.now)
          user.update_attribute(:password_fails, 0)
        end
      flash.now[:danger] = "Invalid Username and Password"
      render 'new'
    end
    
    
   else
     flash.now[:danger] = "Account is locked for five failed password attempts. Contact Support or wait 15 minutes"
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
