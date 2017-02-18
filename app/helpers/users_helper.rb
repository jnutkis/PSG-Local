module UsersHelper
  def active?
    if !logged_in?
      redirect_to root_path
    elsif current_user.active != 1 
      logout
      redirect_to root_path
    end
  end
  
end
