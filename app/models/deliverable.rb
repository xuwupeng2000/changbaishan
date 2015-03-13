class Deliverable < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :address, :cost, :order
end
