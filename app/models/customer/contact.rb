class Customer::Contact < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :name, :detail, :customer

  def one_line_detail
    [name, detail].join(' : ')
  end

end
