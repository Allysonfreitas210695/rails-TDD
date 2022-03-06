require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with description, price and category" do
    product = build(:product)
    expect(product).to be_valid
  end

  it "is invalid without description" do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without price" do
    product = build(:product, price: nil)
    expect(product).to be_invalid
  end

  it "is invalid without category" do
    product = build(:product, category: nil)
    expect(product).to be_invalid
  end

  it "return a product with full description" do
    product = build(:product)
    expect(product.full_description).to eq("#{product.description} - #{product.price}")
  end

  # it "is invalid without description" do
  #   product = build(:product, description: nil)
  #   expect(product).to be_invalid
  # end

end
