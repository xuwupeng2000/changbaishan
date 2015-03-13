class Customer::Contact < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :name, :detail, :customer

  attr_accessor :name, :detail
end
