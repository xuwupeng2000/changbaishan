class Order < ActiveRecord::Base
  before_save :generate_order_code

  belongs_to :user
  belongs_to :customer
  has_one :deliverable

  has_many :sub_order
  has_many :product, through: :sub_order

  validates_presence_of :customer, :user, :placed_at, :code
  validates_uniqueness_of :code

  def total_value
    value = sub_orders.inject{ |sum, sub_order| sum + sub_order.value }
    value
  end

  def generate_order_code
    # code 是订单代码，如果物流有代码就用物流的，物流没有，我们就自己 generate one
  end
end
