class Customer::ContactsController < ApplicationController
  respond_to :json

  def update
    @contact = Customer::Contact.find(params[:id])
    @contact.update_attributes(customer_contact_params)
    
    render :update
  end

  def create
    @contact = Customer::Contact.new(customer_contact_params)
    @contact.customer_id = params[:customer_id]
    @contact.save

    render :create
  end

  def destroy
    @contact = Customer::Contact.find(params[:id])
    @customer = @contact.customer
    @contact.destroy

    @customer_contacts = @customer.customer_contacts

    render :destroy
  end

  private

  def customer_contact_params
    params.require(:contact).permit(:name, :detail, :customer_id)
  end

end
