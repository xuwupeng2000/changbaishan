class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :preference
  has_many :customer_contact

  attr_accessor :name, :address

  validates_presence_of :name, :address
end
