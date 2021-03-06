require 'filmography'

describe Filmography do
  describe '.show' do
    it "Returns a list of actor's filmography" do
      culkin_films = Filmography.show("Macaulay_Culkin")["films"]
      cruise_films = Filmography.show("Tom_Cruise")["films"]

      expect(culkin_films.length).to eq(10)
      expect(culkin_films.first).to eq("Home Alone")
      expect(cruise_films.length).to eq(26)
      expect(cruise_films.first).to eq("Vanilla Sky")
    end

    it "Does not make new query if it has already been made" do
      Filmography.show("Macaulay_Culkin")

      expect(Filmography).to receive(:retrieve_films)
      Filmography.show("Macaulay_Culkin")
    end
  end
end
