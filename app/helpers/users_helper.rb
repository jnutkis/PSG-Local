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
  
  def force_password
    if current_user.newpw != 0
      flash.now[:info] = "Your Password must be updated"
      redirect_to user_update_password_path unless request.fullpath == '/update-password'
    end
  end
  
  def timeDiff(user)
    a = (Time.now - user.locked_at)/60
    return (15 - a).to_i
  end
  
end
