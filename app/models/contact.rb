class Contact < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :name

  attr_accessor :name, :detail
end
