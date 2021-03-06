module AuthModule
  protected
  def current_user
    @current_user ||= session[:user_id].present? ? User.find(session[:user_id]) : User.find(2)
  end

  def current_user?
    !current_user.anonymous?
  end

  def require_admin
    if current_user?
      unless current_user.admin?
        flash[:notice] = "No eres admin."
        redirect_to root_path
      end
    elsif store_location
      redirect_to login_path
    end
  end

  def require_user
    if current_user.anonymous?
      store_location
      redirect_to login_path
    end
  end

  def store_location(location = nil)
    location ||= request.fullpath
    session[:return_to] = location
  end

  def stored_or(default_path)
    path = session[:return_to] || default_path
    session[:return_to] = nil
    path
  end

  def signed_in?
    !!current_user
  end

  def clear_user
    @current_user = nil
    session[:user_id] = nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
