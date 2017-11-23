require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "bike is docked" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq subject.bikes
  end

  it "bike is seen" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  #it "Should raise error if try to dock bike when at full capacity" do
    #  subject.dock(Bike.new)
    #  expect { subject.dock(Bike.new) }.to raise_error("Docking station is full already")
  #end

  it { is_expected.to respond_to :bikes }

  describe '#release_bike' do
    it "should release" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "Should raise error if no bike present" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it "Cannot dock more than 20 bikes in one docking station" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Docking station is full already")
    end
  end
end
