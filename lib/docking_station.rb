require_relative 'van'
require_relative 'bike'
require_relative 'garage'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise("No bikes available") if empty?
    raise("Bike Broken") if broken?
    @bikes.pop
  end

  def dock(bike, working = bike.working?)
    raise("Docking station is full already") if full?
    bike.working = working
    @bikes << bike
  end

  def release_broken_bikes
    broken_bikes = []
    @bikes, broken_bikes = @bikes.partition { |bike| bike.working? }
    broken_bikes
  end

  private

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def broken?
    @bikes.last.working? == false
  end
end
