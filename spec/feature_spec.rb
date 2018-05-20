describe 'user stories diagrams' do

# 1st user story diagram
# Airport <-- land(plane) ==> the plane lands at the airport
  it "instructs the plane to land at the airport" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

# 2nd user story diagram
# Airport <-- take_off(plane) => the plane takes off from the airport/check to see it's not in the airport anymore
  it "instructs a plane to take_off and checks if it has" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end

# 3rd user story diagram
# Airport <-- stormy? ==> plane doesn't take off when stormy
  it "prevents plane take_off when the weather is stormy " do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error ' Weather is stormy - cannot take_off! '
  end

  # 4th user story diagram
  # Airport <-- stormy? ==> plane doesn't land when stormy
  it "prevents plane landing when the weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error ' Weather is stormy - cannot land! '
  end

  # 5th user story diagram
  # Airport <-- land(plane) ==> plane doesn't land when full
  it "prevents the plane to land when the airport is full" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error ' Airport is full - cannot land '
  end

end
