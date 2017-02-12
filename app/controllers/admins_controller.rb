class AdminsController < ApplicationController
  def index
    if !admin? && !super?
      redirect_to root_path
    end
    
    @vendors = Vendor.all
    @references = Reference.all
    
    @vendor = Vendor.find_by(id: current_user.vendor_id)
  end
end
