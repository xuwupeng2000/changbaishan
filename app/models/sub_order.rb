class SubOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :good

  validates_presence_of :order, :good
end

