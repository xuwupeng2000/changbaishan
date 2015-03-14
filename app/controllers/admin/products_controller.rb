class Admin::ProductsController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      key_word = "%#{ params[:filter] }%"
      scope = Product.where{( name.like key_word ) | ( id == key_word ) | ( description.like key_word )}
    else
      scope = Product.all
    end
    @products = smart_listing_create(:products, scope, partial: "admin/products/listing")
  end

  def update

  end

  def create

  end

end
