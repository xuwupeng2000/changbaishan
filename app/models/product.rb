class Product < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :product_category, class_name: 'Product::Category'

  validates_presence_of :user, :name, :product_category 
  validate :validate_proper_prices

  state_machine :state, :initial => :active do
    event :activate do
        transition all => :active
    end

    event :archive do
      transition all => :archived
    end
  end

  private

  def validate_proper_prices
    return if is_public == true

    errors.add(:selling_price, 'need to be a price')  unless selling_price && selling_price > 0
    errors.add(:purchase_price, 'need to be a price') unless purchase_price && purchase_price > 0
  end
end
