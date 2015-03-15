class Upstream::Contact < ActiveRecord::Base
  belongs_to :upstream

  validates_presence_of :name, :detail, :upstream
end
