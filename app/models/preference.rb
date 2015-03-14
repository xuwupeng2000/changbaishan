class Preference < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :margin, :profit_per_item, :customer
end
