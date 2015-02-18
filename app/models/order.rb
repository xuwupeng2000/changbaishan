class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :deliverable

  has_many :sub_order
  has_many :product, through: :sub_order

  attr_accessor :placed_at, :code

  validates_presence_of :customer, :user, :placed_at, :code
  validates_uniqueness_of :code

  def total_value
    value = sub_orders.inject{ |sum, sub_order| sum + sub_order.value }
    value
  end
end
