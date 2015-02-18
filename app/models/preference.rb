class Preference < ActiveRecord::Base
  belongs_to :customer

  attr_accessor :margin

  validates_presence_of :margin, :customer
end
