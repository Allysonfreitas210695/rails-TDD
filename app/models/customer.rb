class Customer < ApplicationRecord
  has_many :orders
  validates_presence_of :address

  def full_name
    "Sr. #{self.name}"
  end
end
