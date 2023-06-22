require_relative '../genre'

RSpec.describe Genre do
    describe "#initialize" do
      it "creates a new genre instance with the provided name" do
        name = "Rock"
        genre = Genre.new(name)
        expect(genre.name).to eq(name)
      end
  
      it "initializes the items array as an empty array" do
        genre = Genre.new("Rock")
        expect(genre.items).to be_empty
      end
    end
  end