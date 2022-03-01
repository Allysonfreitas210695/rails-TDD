require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "#full_name - sobrescrevendo atributos" do
    customer = create(:customer, name: "allyson")
    expect(customer.full_name).to eq("Sr. allyson")
  end

  it "#full_name" do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1)}
end
