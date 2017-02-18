class UsersController < ApplicationController
  include UsersHelper
  before_action :active?
  
    def new
      @user = User.new
    end
  
    def create
    @user = User.new(new_user_params)
    @user.vendor_id = current_user.vendor_id
    if @user.save!
      @user.send_activation_email
      flash[:info] = "User has been sent an activation email"
      redirect_to administration_url
    else
      redirect_to root_path
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
    @user = User.find(params[:id])
    @vendor = Vendor.find(current_user.id)
    @right = true if current_user.id == params[:id].to_i
    if !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  def update
    @user = User.find(params[:id])
    if !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
      redirect_to root_path
    end
    if @user.update_attributes(user_params)
      redirect_to administration_path
    elsif 
      flash.now[:danger] = "Error"
      render 'edit'
     
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :active)
  end
  
   def new_user_params
    params.require(:user).permit(:email, :firstname, :lastname)
  end

end
