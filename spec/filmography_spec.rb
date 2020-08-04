require 'filmography'

describe Filmography do
  describe '.show' do
    it "Returns a list of actor filmography" do
      expect(Filmography.show.length).to eq(11)
    end
  end
end
