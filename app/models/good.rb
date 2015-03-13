class Good < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :upstream

  # 可以不输入商家的资料
  validates_presence_of :purchase_price, :selling_price, :user, :product
end
