class Admin::UsersController <  Admin::BaseController

  def index
    @users = smart_listing_create(:users, User.all, partial: "admin/users/listing")
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    redirect_to admin_users_path
  end

  # Pending feature
  def create

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end


end
