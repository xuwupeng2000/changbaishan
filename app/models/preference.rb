class Preference < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :profit_margin, :profit_per_item, :customer

end
