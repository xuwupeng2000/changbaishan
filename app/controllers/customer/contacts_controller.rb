class Customer::ContactsController < ApplicationController

  def update
    @contact = Customer::Contact.find(params[:id])
    @contact.update_attributes(customer_contact_params)
    @errors = @contact.errors.full_messages
    
    respond_to do |fmt|
      fmt.json {
        if @errors.blank?
          render :update
        else
          render :errors, status: 422
        end
      }
    end
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = Customer::Contact.new(customer_contact_params)
    @contact.customer_id = @customer.id
    @contact.save
    @errors = @contact.errors.full_messages

    respond_to do |fmt|
      fmt.html {
        flash[:notice] = 'New customer contact has been created successfully'
        redirect_to customer_path(@customer.id) 
      }
    end
  end

  def destroy
    @contact = Customer::Contact.find(params[:id])
    @customer = @contact.customer
    @contact.destroy

    @customer_contacts = @customer.customer_contacts

    respond_to do |fmt|
      fmt.json {
        render :destroy
      }
    end
  end

  private

  def customer_contact_params
    params.require(:customer_contact).permit(:name, :detail, :id)
  end

end
