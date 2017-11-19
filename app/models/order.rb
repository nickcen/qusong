class Order < ApplicationRecord
  include Workflow

  belongs_to :category
  belongs_to :user
  belongs_to :user_address

  has_many :waybills

  workflow_column :courier_status 

  workflow do
    state :new do
      event :wuliu_qu_paidan, :transitions_to => :accpeted
      event :reject, :transitions_to => :rejected
    end
    state :accpeted do
      event :finish, :transitions_to => :finished
      event :turnback, :transitions_to => :turnbacked
    end
    state :rejected
    state :finished
    state :turnbacked
  end

  after_create :create_waybill
  def create_waybill
    station = self.user_address.city.stations.sample
    courier = station.couriers.sample

    self.waybills.create(sender: self.user, receiver: courier, from_address: user_address.address, to_address: station.address)
  end
end
