require "./lib/van"
describe Van do
  
  it "Van should take something" do
    expect(Van.new).to respond_to(:cargo=)
  end

  it "Van should be able to deliver cargo" do
    van = Van.new
    (van).cargo = 'item'
    expect(van.cargo).to eq('item')
  end

end
