class ProductCategory  < ActiveRecord::Base
  has_many :product

  attr_accessor :name, :description

  validates_presence_of :name
  validates_uniqueness_of :name
end
