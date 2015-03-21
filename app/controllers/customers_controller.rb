class CustomersController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  before_action :authenticate_user

  def index
    unless params[:filter].blank?
      keyword = "%#{ params[:filter] }%"
      scope = Customer.joins(:customer_contacts).where{( name.like keyword ) | ( address.like keyword ) | ( customer_contacts.detail.like keyword )}
    else
      scope = Customer.includes(:customer_contacts).all
    end
    @customers = smart_listing_create(:customers, scope, partial: "customers/listing")
  end

  def show
    @customer = Customer.includes(:customer_contacts).find(params[:id])
    gon.customer          = @customer
    gon.customer_contacts = @customer.customer_contacts

    respond_to do |fmt|
      fmt.json { render :show }
      fmt.html { render :show }
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)

    respond_to do |fmt|
      fmt.json { render :update }
    end
  end

  def destroy

  end

  def new

  end

  def create

  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address)
  end

end
