## Goals: Design a parking lot using object-oriented principles

##Here are a few methods that you should be able to run:

## Tell us how many spots are remaining
## Tell us how many total spots are in the parking lot
## Tell us when the parking lot is full
## Tell us when the parking lot is empty
## Tell us when certain spots are full e.g. when all motorcycle spots are taken
## Tell us how many spots vans are taking up
## Assumptions:

## The parking lot can hold motorcycles, cars and vans
## The parking lot has motorcycle spots, car spots and large spots
## A motorcycle can park in any spot
## A car can park in a single compact spot, or a regular spot
## A van can park, but it will take up 3 regular spots
## These are just a few assumptions. Feel free to ask your interviewer about more assumptions as needed.

class Vehicle
  attr_reader :license_plate

  def initialize(license_plate)
    @license_plate = license_plate
  end
end

class Motorcycle < Vehicle
end

class Car < Vehicle
end

class Van < Vehicle
end

class ParkingSpot
  attr_reader :spot_id, :size
  attr_accessor :vehicle

  def initialize(spot_id, size)
    @spot_id = spot_id
    @size = size
    @vehicle = nil
  end

  def is_available?
    @vehicle.nil?
  end
end

class ParkingLot
  attr_reader :motorcycle_spots, :car_spots, :large_spots

  def initialize(motorcycle_spots, car_spots, large_spots)
    @motorcycle_spots = Array.new(motorcycle_spots) { |i| ParkingSpot.new(i, :motorcycle) }
    @car_spots = Array.new(car_spots) { |i| ParkingSpot.new(i, :car) }
    @large_spots = Array.new(large_spots) { |i| ParkingSpot.new(i, :large) }
  end

  def parking_lot(vehicle)
    if vehicle.is_a?(Motorcycle)
      spot = find_available_spot(motorcycle_spots)
      spot.vehicle = vehicle if spot
      return spot
    elsif vehicle.is_a?(Car)
      compact_spot = find_available_spot(car_spots.select { |spot| spot.size == :compact })
      regular_spot = find_available_spot(car_spots.select { |spot| spot.size == :regular })
      spot = compact_spot || regular_spot
      spot.vehicle = vehicle if spot
      return spot
    elsif vehicle.is_a?(Van)
      spots = find_consecutive_available_spots(large_spots, 3)
      if spots
        spots.each { |spot| spot.vehicle = vehicle }
        return spots
      end
    end
    nil
  end

  def remove_vehicle(spot)
    spot.vehicle = nil
  end

  def available_spots
    motorcycle_spots.count(&:is_available?) + car_spots.count(&:is_available?) + large_spots.count(&:is_available?)
  end

  def total_spots
    motorcycle_spots.size + car_spots.size + large_spots.size
  end

  def is_full?
    available_spots.zero?
  end

  def is_empty?
    available_spots == total_spots
  end

  def is_motorcycle_spot_full?
    motorcycle_spots.none?(&:is_available?)
  end

  def vans_count
    large_spots.each_cons(3).count { |spots| spots.all?(&:is_available?) }
  end

  private

  def find_available_spot(spots)
    spots.find(&:is_available?)
  end

  def find_consecutive_available_spots(spots, count)
    spots.each_cons(count).find { |spots| spots.all?(&:is_available?) }
  end
end

