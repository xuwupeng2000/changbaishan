class Product < ActiveRecord::Base
  belongs_to :user

  attr_accessor :name, :cost, :description

  validates_presence_of :user, :name, :cost
end
