class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category

  attr_accessor :name, :description, :weight

  validates_presence_of :user, :name
end
