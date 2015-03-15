class Customer < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :preference
  has_many :customer_contact, class_name: 'Customer::Contact'

  validates_presence_of :name, :address

  def perferances
    'WIP'
  end

  def recent_orders
    'WIP'
  end
end
