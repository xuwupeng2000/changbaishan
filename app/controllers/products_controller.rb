class ProductsController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  layout "table", only: [:index]

  def index
    unless params[:filter].blank?
      keyword = "%#{ params[:filter] }%"
      scope = current_user.products.where{ ( name.like keyword ) | ( description.like keyword )}
    else
      scope = current_user.products
    end
    @products = smart_listing_create(:products, scope, partial: "products/listing")
  end

  def edit
    @product = Product.find(params[:id])
    gon.product = @product
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:success] = 'Product has been updated successfully'
      redirect_to products_path
    else
      gon.product = @product
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |fmt|
      fmt.json {
        render :show
      }
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.is_public = false

    if @product.save
      flash[:notice] = "New product #{@product.name} has been created successfully"
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = 'Product has been removed from your repo'
    redirect_to products_path
  end

  def search
    @products = Product.all

    respond_to do |fmt|
      fmt.json {
        render :search, status: 200
      }
    end
  end

  def new
    @product = Product.new()
    gon.product = @product
  end

  private

  def product_params
    params.required(:product).permit(:product_category_id, :name, :weight, :purchase_price, :selling_price, :description)
  end

end
