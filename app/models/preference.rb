class Preference < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :margin, :profit_per_item, :customer

  state_machine :state, :initial => :active do
    event :enable do
        transition all => :active
    end

    event :archive do
      transition all => :archived
    end
  end

end
