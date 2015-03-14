class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category, class_name: 'Product::Category'

  validates_presence_of :user, :name, :product_category
end
