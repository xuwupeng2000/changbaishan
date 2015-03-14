class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category, class_name: 'Product::Category'

  validates_presence_of :user, :name, :product_category

  state_machine :state, :initial => :active do
    event :enable do
        transition all => :active
    end

    event :disable do
      transition all => :off
    end
  end
end
