class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :preference
  has_many :customer_contact

  validates_presence_of :name, :address
end
