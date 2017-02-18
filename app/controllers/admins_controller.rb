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
end
