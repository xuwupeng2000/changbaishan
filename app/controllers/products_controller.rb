class ProductsController < ApplicationController

  def index

  end

  def update
    
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
      flash[:notice] = "New product #{product.name} has been created successfully"
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    
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
  end

  private

  def product_params
    params.required(:product).permit(:product_category_id, :name, :weight, :purchase_price, :selling_price, :description)
  end

end
