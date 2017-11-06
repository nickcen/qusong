class AddCityToCouriers < ActiveRecord::Migration[5.0]
  def change
    add_reference :couriers, :city
  end
end
