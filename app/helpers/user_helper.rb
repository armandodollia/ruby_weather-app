helpers do
  def logged_in?
    !!session[:user_id]
  end
  
  def authorized?(arg_id)
    session[:user_id] == arg_id.to_i
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def find_user(id)
    User.find_by(id: id)
  end
  
  def authorization_redirect
    return redirect back if !logged_in?
  end
end
