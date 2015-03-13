class UpstreamContact < ActiveRecord::Base
  belongs_to :upstream

  attr_accessor :name, :detail
  validates_presence_of :name, :detail, :upstream
end
