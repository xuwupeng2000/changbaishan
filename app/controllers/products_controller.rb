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

end
