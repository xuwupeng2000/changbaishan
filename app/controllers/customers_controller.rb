class CustomersController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  before_action :authenticate_user

  def index
    unless params[:filter].blank?
      keyword = "%#{ params[:filter] }%"
      scope = Customer.joins{ customer_contacts.outer }.where{( name.like keyword ) | ( address.like keyword ) | ( customer_contacts.detail.like keyword )}
    else
      scope = Customer.includes(:customer_contacts).all
    end
    @customers = smart_listing_create(:customers, scope, partial: "customers/listing")
  end

  def show
    @customer = Customer.includes(:customer_contacts).find(params[:id])
    gon.customer          = @customer
    gon.customer_contacts = @customer.customer_contacts.order('updated_at DESC')
    gon.contact_types = %w(Phone QQ WeChat Facebook Skype)

    respond_to do |fmt|
      fmt.json { render :show }
      fmt.html { render :show }
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    @errors = @customer.errors.full_messages

    respond_to do |fmt|
      fmt.json { 
        if @errors.blank?
          render :update 
        else
          #422 = :unprocessable_entity
          render :errors, status: 422
        end
      }
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    flash[:notice] = 'Customer has been removed from your list'
    redirect_to customers_path
  end

  def new
    @customer = Customer.new(user_id: current_user.id)
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user

    respond_to do |fmt|
      fmt.html {
        if @customer.save
          flash[:notice] = 'Customer has been create, more detail can be added within this page'
          redirect_to customer_path(@customer)
        else
          render :new
        end
      }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :id, :detail)
  end

end
