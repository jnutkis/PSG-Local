class AdminsController < ApplicationController
  include UsersHelper
  before_filter :active?
  def index
    if !admin? && !super?
      redirect_to root_path
    else
    @vendors = Vendor.all.order(:name)
    @references = Reference.all.order(:full_ref)
    
    @vendor = Vendor.find_by(id: current_user.vendor_id)
   end
  end
end
