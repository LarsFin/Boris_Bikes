require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise("No bikes available") if empty?
    raise("Bike Broken") if (@bikes.last.working? == false)
    @bikes.pop
  end

  def dock(bike, working = bike.working?)
    raise("Docking station is full already") if full?
    bike.working = working
    @bikes << bike
  end

  private

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

end
