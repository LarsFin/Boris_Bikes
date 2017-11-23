require "./lib/garage"
describe Garage do
  it "Garage should take something" do
    expect(Garage.new).to respond_to(:storage=)
  end

  it "Garage should be able to release stored items" do
    garage = Garage.new
    (garage).storage = 'item'
    expect(garage.storage).to eq('item')
  end
end
