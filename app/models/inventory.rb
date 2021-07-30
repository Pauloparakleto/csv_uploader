class Inventory < ApplicationRecord
  validates :name, presence: { message: "O nome não pode ficar em branco" }
  validates :value, presence: { message: "O valor não pode ficar em branco" }
  validates :quantity, presence: { message: "A quantidade não pode ficar em branco" }
  validates :manufacturer, presence: { message: "O nome do fabricante não pode ficar em branco" }
  validates :model, presence: { message: "O modelo não pode ficar em branco" }
  validates :color, presence: { message: "A cor não pode ficar em branco" }
  validates :carrier_plan_type, presence: { message: "O plano do aparelho não pode ficar em branco" }
  validates :price, presence: { message: "O preço não pode ficar em branco" }
end
