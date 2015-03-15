class CustomersController < ApplicationController

  def index
    unless params[:filter].blank?
      key_word = "%#{ params[:filter] }%"
      scope = Customer.includes(:user).where{( name.like key_word ) | ( address.like key_word ) | ( id == key_word )}
    else
      scope = Customer.includes(:user).all
    end
    @customers = smart_listing_create(:customers, scope, partial: "admin/customers/listing")
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def new

  end

  def create

  end

  private

  def customer_params

  end

end
