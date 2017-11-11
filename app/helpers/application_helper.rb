module ApplicationHelper
  def admin_dash user
    if logged_in?(:admin)
      (link_to "Admin Dashboard", admin_root_path)
    end 
  end
end