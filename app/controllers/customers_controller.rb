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
