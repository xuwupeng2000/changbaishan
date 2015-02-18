class SubOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessor :value, :quantity

  validates_presence_of :order
end

