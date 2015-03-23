class Customer < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :preference
  has_many :customer_contacts, class_name: 'Customer::Contact'

  validates_presence_of :name, :address, :user
  validates_uniqueness_of :name, scope: [:user_id]

  def perferances
    'WIP'
  end

  def recent_orders
    'WIP'
  end
end
