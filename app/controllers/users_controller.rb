class UsersController < ApplicationController
  def login
    
  end
  
  def show
    @user = current_user
    if !logged_in? || current_user != User.find(params[:id])
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path

  end
  
  
  def edit
    @user = current_user
    @vendor = Vendor.find(current_user.id)
    if !logged_in? || current_user != User.find(params[:id])
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  def update
    @user = current_user
    if !logged_in? || current_user != User.find(params[:id])
      redirect_to root_path
    end
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id)
    elsif 
      flash.now[:danger] = "Error"
      render 'edit'
     
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :active)
  end
end
