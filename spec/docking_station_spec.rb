require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "Be able to set a new capacity of bikes on initialization, else defaults to 20" do
    expect((dock = DockingStation.new(1)).capacity).to eq 1
    expect(subject.capacity).to eq 20
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

  it { is_expected.to respond_to :bikes }

  describe '#release_bike' do
    it "should release" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working

     bike = Bike.new
     bike.working = false
    subject.dock(bike)

    expect {subject.release_bike }.to raise_error("Bike Broken")
  end

    it "Should raise error if no bike present" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it "Cannot dock more than capacity" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error("Docking station is full already")
    end

    it "Will accept broken bikes" do
      bike = Bike.new
      bike.working = false
      expect {subject.dock(bike)}.not_to raise_error
    end

    it "will accept an argument that corresponds to whether the bike is working" do
      expect {subject.dock(Bike.new, false)}.not_to raise_error 
      expect(subject).to respond_to(:dock).with(2).arguments
    end

  end
end
