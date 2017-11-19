class Station < ApplicationRecord
  has_one :address, as: :addressable

  has_and_belongs_to_many :couriers

  accepts_nested_attributes_for :address

  belongs_to :city

  def to_s
    self.name
  end
end
