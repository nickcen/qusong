class City < ApplicationRecord
  has_many :stations
  has_many :couriers
end
