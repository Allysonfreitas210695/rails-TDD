require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "Create a Custumer" do
    customer = create(:customer)
    expect(customer.full_name).to eq("Sr. Allyson Bruno")
  end
end
