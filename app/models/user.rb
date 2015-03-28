class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :customers
  has_many :orders

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, case_sensitive: true

  def name
    name = [first_name, last_name].join(' ')
  end

  state_machine :state, :initial => :active do
    event :enable do
        transition all => :active
    end

    event :disable do
      transition all => :disabled
    end
  end
end
