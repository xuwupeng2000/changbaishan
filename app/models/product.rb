class Product < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :product_category, class_name: 'Product::Category'

  validates_presence_of :user, :name, :product_category 
  validates_numericality_of :selling_price, :purchase_price, message: 'has to be a number and greater than 0', greater_than: 0, unless: Proc.new { |product| product.is_public == true }

  state_machine :state, :initial => :active do
    event :activate do
        transition all => :active
    end

    event :archive do
      transition all => :archived
    end
  end
end
