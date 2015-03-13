class Admin::UsersController <  Admin::BaseController

  def index
    @users = smart_listing_create(:users, User.all, partial: "admin/users/listing")
  end

  def update

  end

  def create

  end

end
