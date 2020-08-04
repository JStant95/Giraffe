require 'cast'

describe Cast do
  describe ".show" do
    it "Returns that cast of a given film" do
      hellraiser = Cast.show("Hellraiser")["cast"]
      home_alone = Cast.show("Home_Alone")["cast"]

      expect(hellraiser.length).to eq(3)
      expect(home_alone.length).to eq(5)
    end
  end
end
