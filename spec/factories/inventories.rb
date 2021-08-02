FactoryBot.define do
  factory :inventory do
    name { "MyString" }
    value { "MyString" }
    quantity { [20, 20, 20, 20, 10, 5, 5].sample }
    manufacturer { %w[Motorola Samsung Apple].sample }
    model { ["Moto G5 16GB" ].sample }
    color { %w[Preto Cinza].sample }
    carrier_plan_type { %w[Pré Pós].sample }
    price { 999.98 }
  end
end
