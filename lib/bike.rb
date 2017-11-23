class Bike
  #attr_reader :bike

  def initialize
    @working = true
  end

  def working= working
	@working = working
  end

  def working?
    @working
  end
end
