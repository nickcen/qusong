class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  def to_s
    self.address
  end
end
