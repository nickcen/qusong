class Courier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :city

  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill
end
