class UserAddress < ApplicationRecord
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

  belongs_to :user

  belongs_to :city

  def to_s
    self.name
  end
end