module UserHelper
  def admin?
    current_user && current_user.has_role?(:admin)
  end
end
