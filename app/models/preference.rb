class Preference < ActiveRecord::Base
  belongs_to :customer

  attr_accessor :margin, :profit_per_item

  validates_presence_of :margin, :profit_per_item, :customer
end
