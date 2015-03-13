class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category

  validates_presence_of :user, :name
end
