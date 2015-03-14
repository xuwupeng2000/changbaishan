class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :preference
  has_many :customer_contact, class_name: 'Customer::Contact'

  validates_presence_of :name, :address
end
