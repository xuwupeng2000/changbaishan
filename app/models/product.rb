class Product < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :product_category, class_name: 'Product::Category'

  validates_presence_of :user, :name, :product_category

  state_machine :state, :initial => :active do
    event :activate do
        transition all => :active
    end

    event :archive do
      transition all => :archived
    end
  end
end
