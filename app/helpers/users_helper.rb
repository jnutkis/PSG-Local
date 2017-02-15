module UsersHelper
  def active?
    if current_user.active != 1
      logout
      redirect_to root_path
    end
  end
end
