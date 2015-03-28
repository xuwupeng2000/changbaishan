class Admin::UsersController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      raw_keyword = params[:filter]
      keyword = "%#{ params[:filter] }%"
      scope = User.where{( first_name.like keyword ) | ( last_name.like keyword ) | ( email.like keyword ) | ( id == raw_keyword )}
    else
      scope = User.all
    end
    @users = smart_listing_create(:users, scope, partial: "admin/users/listing")
  end

  def update
    @user = User.find(params[:id])

    respond_to do |fmt| 
      fmt.js {
        if @user.update_attributes(user_params)
          flash[:notice] = 'User has been updated successfully'
          redirect_to admin_users_path
        else
          render :update
        end
      }
    end
  end

  # Pending feature
  def create

  end

  def show
    @user = User.find(params[:id])
  end

  def disable
    @user = User.find(params[:id])
    @user.disable

    flash[:success] = 'User has been archived'
    redirect_to admin_users_path
  end

  def enable
    @user = User.find(params[:id])
    @user.enable

    flash[:success] = 'User has been enabled (active)'
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def search_keyword
  end


end
