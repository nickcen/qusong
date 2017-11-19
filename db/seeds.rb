# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.strategy = :truncation, {:only => [:couriers, :couriers_stations]}
DatabaseCleaner.clean

city = City.first

city.stations.each do |station|
  1.upto(3).each do |i|
    courier = Courier.create(email: "courier#{i}_station_#{station.id}@washing.com", password: '111111', city: city)
    station.couriers << courier
  end
end

