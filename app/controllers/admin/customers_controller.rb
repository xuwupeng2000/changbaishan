class Admin::CustomersController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      key_word = "%#{ params[:filter] }%"
      scope = Customer.includes(:user).where{( name.like key_word ) | ( address.like key_word ) | ( id == key_word )}
    else
      scope = Customer.includes(:user).all
    end
    @customers = smart_listing_create(:customers, scope, partial: "admin/customers/listing")
  end

end
