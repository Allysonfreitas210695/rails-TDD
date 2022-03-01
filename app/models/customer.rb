class Customer < ApplicationRecord
  has_many :orders
  
  def full_name
    "Sr. #{self.name}"
  end
end
