FactoryBot.define do
  factory :order do
    sequence (:description) { |n| "pedido - #{n}"}
    # association :customer, factory: :customer
    customer
  end
end
