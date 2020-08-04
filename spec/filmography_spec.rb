require 'filmography'

describe Filmography do
  describe '.show' do
    it "Returns a list of Macaulay Culkin's filmography" do
      films = Filmography.show["films"]

      expect(films.length).to eq(10)
      expect(films.first).to eq("Home Alone")
    end
  end
end
