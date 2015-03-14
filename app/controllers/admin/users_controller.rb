class Admin::UsersController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      key_word = "%#{ params[:filter] }%"
      scope = User.where{( first_name.like key_word ) | ( last_name.like key_word ) | ( email.like key_word ) | ( id == key_word )}
    else
      scope = User.all
    end
    @users = smart_listing_create(:users, scope, partial: "admin/users/listing")
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    redirect_to admin_users_path
  end

  # Pending feature
  def create

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def search_keyword
  end


end
