class User < ApplicationRecord
  has_many :user_addresses

  has_many :orders

  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill

  def to_s
    "User #{self.id}"
  end
end
