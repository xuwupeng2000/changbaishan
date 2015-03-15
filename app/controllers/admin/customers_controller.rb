class Admin::CustomersController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      raw_keyword = params[:filter]
      keyword = "%#{ params[:filter] }%"
      scope = Customer.includes(:user).where{( name.like keyword ) | ( address.like keyword ) | ( id == raw_keyword )}
    else
      scope = Customer.includes(:user).all
    end
    @customers = smart_listing_create(:customers, scope, partial: "admin/customers/listing")
  end

end
