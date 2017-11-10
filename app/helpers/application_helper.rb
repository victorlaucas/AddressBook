module ApplicationHelper
  def sign_in user
    if current_user 
      (link_to "Logout", destroy_user_session_path, method: :delete)
     else 
      (link_to "Sign In", new_user_session_path) + " ".html_safe +
      (link_to "Register", new_user_registration_path)
    end 
  end

  def admin_dash user
    if logged_in?(:admin)
      (link_to "Admin Dashboard", admin_root_path)
    end 
  end
end