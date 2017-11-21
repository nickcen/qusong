class Item < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_price

  def set_price
    price_rule = self.order.category.get_price_rule(self.order.city)

    self.price = self.product.price.send("price#{price_rule.grade}")
  end
end
