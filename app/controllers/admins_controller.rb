class AdminsController < ApplicationController
  include UsersHelper
  before_action :active?,:vendor_active?
  def index
    if !admin? && !super?
      redirect_to root_path
    else
    @vendors = Vendor.all.order(:name)
    @references = Reference.all.order(:full_ref)
    @users = User.all.where(vendor_id: current_user.vendor_id).where.not(id: current_user.id)
    
    @vendor = Vendor.find_by(id: current_user.vendor_id)
   end
  end
  
  def vendor
    if !super? #check for super_user, if not redirect
      redirect_to administration_path
    end
    @vendor = Vendor.find_by(name: params[:id])
    
    if @vendor.nil? #if vendor not found, redirect
      flash[:danger] = "Vendor Not Found"
      redirect_to administration_path
    end
    
    @users = User.all.where(vendor_id: @vendor.id) if !@vendor.nil?
    
  end
  
  def new_user
    if !super? #check for super_user, if not redirect
      redirect_to administration_path
    end 
    @vendor = Vendor.find_by(name: params[:id])
    @user = User.new
    if @vendor.nil? #if vendor not found, redirect
      flash[:danger] = "Vendor Not Found"
      redirect_to administration_path
    end
  end
  
  def create_user
    @user = User.new(new_user_params)
    @vendor = Vendor.find_by(name: params[:id])
    @user.vendor_id = @vendor.id
    if @user.save
      @user.send_activation_email
      flash[:success] = "User has been sent an activation email"
      redirect_to administration_url
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      render 'new' 
    end
  end
  
  def disable_vendor
    if super?
      @vendor = Vendor.find_by(name: params[:id])
      @vendor.update_attribute(:active,0)
      flash[:success] = "Account Disabled"
      redirect_to administration_path
    else
      flash[:danger] = "You don't have permission to do that!"
      redirect_to root_path
    end
  end
  
  def enable_vendor
    if super?
      @vendor = Vendor.find_by(name: params[:id])
      @vendor.update_attribute(:active,1)
      flash[:success] = "Account Enabled"
      redirect_to administration_path
    else
      flash[:danger] = "You don't have permission to do that!"
      redirect_to root_path
    end
  end
  
  private
  def new_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :vendor_id)
  end
end
