require 'rails_helper'

RSpec.describe Order, type: :model do
  it "Tem 1 pedido" do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    # be_kind_of ou be_an ou be_a
    expect(order.customer).to be_an(Customer)
  end

  it "Tem 1 pedido" do
    customer = create(:customer)
    order = create(:order, customer: customer)
    # puts order.description
    # puts order.customer
    # puts order.customer.name
    # be_kind_of ou be_an ou be_a
    expect(order.customer).to be_an(Customer)
  end

  it "Tem 3 pedidos" do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end
end
