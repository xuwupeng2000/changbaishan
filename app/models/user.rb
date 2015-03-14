class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :product
  has_many :customer
  has_many :order

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, case_sensitive: true

  def name
    name = [first_name, last_name].join(' ')
  end
end
