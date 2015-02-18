class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :product
  has_many :customer
  has_many :order

  attr_accessor :email, :name

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email, case_sensitive: true
end
