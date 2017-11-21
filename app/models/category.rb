class Category < ApplicationRecord
  has_many :products
  has_many :price_rules

  def get_price_rule(city_id)
    self.price_rules.where('city_id = ? and from_date <= ?', city_id, Date.today).order(from_date: :desc).first
  end
end
