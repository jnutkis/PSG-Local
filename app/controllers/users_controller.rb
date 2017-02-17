class UsersController < ApplicationController
  include UsersHelper
  before_action :active?
  
    def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "User has been sent an activation email"
      redirect_to administration_url
    else
      render 'new'
    end
  end
  
  
  
  def show
    @user = current_user
    if !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
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
