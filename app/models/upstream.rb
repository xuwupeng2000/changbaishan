class Upstream < ActiveRecord::Base
  belongs_to :user
  has_many :upstream_contact, class_name: 'Upstream::Contact'
  has_many :good

  validates_presence_of :name, :user
end
