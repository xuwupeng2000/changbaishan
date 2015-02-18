class Deliverable < ActiveRecord::Base
  belongs_to :order

  attr_accessor :address, :cost

  validates_presence_of :address, :cost, :order
end
