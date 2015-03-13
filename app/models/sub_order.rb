class SubOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :good

  attr_accessor :value, :quantity

  validates_presence_of :order, :good
end

