class Admin::ProductsController <  Admin::BaseController

  def index
    unless params[:filter].blank?
      key_word = "%#{ params[:filter] }%"
      scope = Product.includes(:product_category).where{( name.like key_word ) | ( id == key_word ) | ( description.like key_word )}
    else
      scope = Product.includes(:product_category).all
    end
    @products = smart_listing_create(:products, scope, partial: "admin/products/listing")
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:success] = 'Product has been updated successfully'
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      flash[:sccess] = 'Product has been created successfully'
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy

  end

  def archive
    @product = Product.find(params[:id])
    @product.archive

    flash[:sccess] = 'Product has been archived'
    redirect_to admin_products_path
  end

  def activate
    @product = Product.find(params[:id])
    @product.activate

    flash[:sccess] = 'Product has been enabled (active)'
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:is_public, :name, :product_category_id, :weight, :description)
  end

end
