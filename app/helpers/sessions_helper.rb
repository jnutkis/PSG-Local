module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def admin?
    if !session[:user_id].nil?
      if current_user.admin == 1
        return true
      end
    end
  end
  
  def super?
    if !session[:user_id].nil?
      if current_user.superuser == 1
        return true
      end
    end
  end
  
  def logout #logout method. delete session cookie for user. set @current_user = nil
    reset_session
    @current_user = nil
  end
  
end
