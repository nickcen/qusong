class Waybill < ApplicationRecord
  belongs_to :order

  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  belongs_to :from_address, class_name: Address
  belongs_to :to_address, class_name: Address

  include Workflow

  workflow_column :status 

  workflow do
    state :new do
      event :accept, transitions_to: :accepted
      event :reject, transitions_to: :rejected
    end
    state :accepted do
      event :finish, transitions_to: :finished
      event :reject, transitions_to: :reject
    end
    state :rejected
    state :finished
  end

  def accept
    self.order.next!
  end

  def finish
    self.order.next!
  end

  def reject
    self.order.prev!
  end
end
