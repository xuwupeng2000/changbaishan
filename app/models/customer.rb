class Customer < ActiveRecord::Base
  belongs_to :user
  belongs_to :preference
  has_many :contact

  attr_accessor :name, :address

  validates_presence_of :name, :address, :user
end
