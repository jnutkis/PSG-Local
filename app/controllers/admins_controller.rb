class AdminsController < ApplicationController
  include UsersHelper
  before_action :active?
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
  
end
