module UsersHelper
  def active?
    if !logged_in?
      redirect_to root_path
    elsif current_user.active != 1 
      logout
      redirect_to root_path
    end
  end
  
  def vendor_active?
      if logged_in? && !super? && Vendor.find_by(id: current_user.vendor_id).active != 1
        logout
        flash[:danger] = "Your organization's access has been disabled"
        redirect_to login_path
      end
  end
  
end
